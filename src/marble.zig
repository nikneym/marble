const std = @import("std");
const math = std.math;

const imp = @import("sys/impeller.zig");
const glfw = @import("sys/glfw.zig");
const metal = @import("sys/metal.zig");
const objc = @import("sys/objc.zig");

const Style = @import("Style.zig");

fn glfw_error_callback(err: c_int, desc: [*c]const u8) callconv(.c) void {
    _ = err;
    _ = desc;
}

pub fn Builder(comptime Ctx: type) type {
    return struct {
        const App = @This();

        allocator: std.mem.Allocator,
        ctx: *Ctx,
        window: *glfw.GLFWwindow,
        /// Lazily initialized at run.
        builder: imp.ImpellerDisplayListBuilder = undefined,
        style: Style,
        dt: f32 = 0.0,

        pub fn init(ctx: *Ctx, allocator: std.mem.Allocator) !App {
            // TODO: assertion.
            _ = glfw.glfwSetErrorCallback(glfw_error_callback);

            try glfw.init();
            errdefer glfw.glfwTerminate();

            glfw.glfwWindowHint(glfw.GLFW_CLIENT_API, glfw.GLFW_NO_API);

            const window = try glfw.createWindow(800, 600, "almond");
            errdefer glfw.glfwDestroyWindow(window);

            return .{
                .allocator = allocator,
                .ctx = ctx,
                .window = window,
                .style = .init(),
            };
        }

        pub fn deinit(app: *App) void {
            glfw.glfwDestroyWindow(app.window);
            glfw.glfwTerminate();
        }

        /// Application cycle:
        ///
        /// [ load ] -> [ update ] -> [ draw ]
        pub fn run(app: *App) !void {
            const window = app.window;
            // Make app reachable from GLFW callbacks.
            glfw.glfwSetWindowUserPointer(window, app);
            // Impeller Context.
            const impeller_ctx = imp.ImpellerContextCreateMetalNew(imp.ImpellerGetVersion());
            std.debug.assert(impeller_ctx != null);
            // Setup Metal.
            // TODO: Add setups for other targets than macOS.
            const layer = attachMetalLayer(window);
            // Main builder.
            const builder = imp.ImpellerDisplayListBuilderNew(null);
            app.builder = builder;

            var dl: imp.ImpellerDisplayList = null;
            var last = glfw.glfwGetTime();

            // Fill background to white.
            app.style.color(255, 255, 255, 255);

            while (!glfw.windowShouldClose(window)) {
                glfw.glfwPollEvents();
                // Calculate & update delta time.
                const now = glfw.glfwGetTime();
                app.dt = @floatCast(now - last);
                last = now;
                // Update callback.
                if (comptime @hasDecl(Ctx, "update")) {
                    try @call(.auto, Ctx.update, .{ app.ctx, app, app.dt });
                }

                // Fill background to white.
                app.style.color(255, 255, 255, 255);
                imp.ImpellerDisplayListBuilderDrawPaint(builder, app.style.paint);
                // Set initial color back to black.
                app.style.color(0, 0, 0, 255);

                // Draw callback.
                if (comptime @hasDecl(Ctx, "draw")) {
                    try @call(.auto, Ctx.draw, .{ app.ctx, app });
                }

                dl = imp.ImpellerDisplayListBuilderCreateDisplayListNew(builder);
                defer imp.ImpellerDisplayListRelease(dl);

                // No ARC, drain each frame's autoreleased drawable ourselves.
                const pool = objc.objc_autoreleasePoolPush();
                defer objc.objc_autoreleasePoolPop(pool);

                const drawable = objc.msgSend(?objc.id, layer, "nextDrawable", .{});
                const surface = imp.ImpellerSurfaceCreateWrappedMetalDrawableNew(impeller_ctx, drawable);
                std.debug.assert(surface != null);
                _ = imp.ImpellerSurfaceDrawDisplayList(surface, dl);
                _ = imp.ImpellerSurfacePresent(surface);
                imp.ImpellerSurfaceRelease(surface);
                //glfw.glfwSwapBuffers(window);
            }
        }

        pub fn setColor(app: *App, red: u8, green: u8, blue: u8, alpha: u8) void {
            return app.style.color(red, green, blue, alpha);
        }

        pub inline fn setDrawStyle(app: *App, mode: Style.DrawStyle) void {
            return app.style.drawStyle(mode);
        }

        pub inline fn setStrokeWidth(app: *App, width: f32) void {
            return app.style.strokeWidth(width);
        }

        pub fn rect(app: *App, x: f32, y: f32, w: f32, h: f32) void {
            const bounds = &imp.ImpellerRect{ .x = x, .y = y, .width = w, .height = h };
            return imp.ImpellerDisplayListBuilderDrawRect(app.builder, bounds, app.style.paint);
        }

        pub fn roundedRect(
            app: *App,
            x: f32,
            y: f32,
            w: f32,
            h: f32,
            top_left: f32,
            bottom_left: f32,
            top_right: f32,
            bottom_right: f32,
        ) void {
            const bounds = &imp.ImpellerRect{ .x = x, .y = y, .width = w, .height = h };
            const radii = &imp.ImpellerRoundingRadii{
                .top_left = .{ .x = top_left, .y = top_left },
                .bottom_left = .{ .x = bottom_left, .y = bottom_left },
                .top_right = .{ .x = top_right, .y = top_right },
                .bottom_right = .{ .x = bottom_right, .y = bottom_right },
            };
            imp.ImpellerDisplayListBuilderDrawRoundedRect(app.builder, bounds, radii, app.style.paint);
        }

        pub fn circle(app: *App, x: f32, y: f32, radius: f32) void {
            const bounds = &imp.ImpellerRect{ .x = x - radius, .y = y - radius, .width = radius * 2, .height = radius * 2 };
            return imp.ImpellerDisplayListBuilderDrawOval(app.builder, bounds, app.style.paint);
        }

        pub fn line(app: *App, x1: f32, y1: f32, x2: f32, y2: f32) void {
            const from = &imp.ImpellerPoint{ .x = x1, .y = y1 };
            const to = &imp.ImpellerPoint{ .x = x2, .y = y2 };
            return imp.ImpellerDisplayListBuilderDrawLine(app.builder, from, to, app.style.paint);
        }

        pub fn beginPath() void {
            return imp.ImpellerPathBuilderNew();
        }
    };
}

/// Backs the window's content view with a `CAMetalLayer` and returns it. The
/// view keeps the layer alive.
fn attachMetalLayer(window: *glfw.GLFWwindow) objc.id {
    // No ARC, drain the autoreleased `[CAMetalLayer layer]` ourselves.
    const pool = objc.objc_autoreleasePoolPush();
    defer objc.objc_autoreleasePoolPop(pool);

    const cocoa_window = glfw.glfwGetCocoaWindow(window).?;

    const layer = objc.msgSend(objc.id, objc.objc_getClass("CAMetalLayer").?, "layer", .{});
    objc.msgSend(void, layer, "setFramebufferOnly:", .{objc.NO});
    objc.msgSend(void, layer, "setPixelFormat:", .{metal.MTLPixelFormatBGRA8Unorm});

    const device = metal.MTLCreateSystemDefaultDevice();
    objc.msgSend(void, layer, "setDevice:", .{device});
    objc.msgSend(void, device, "release", .{});

    const content_view = objc.msgSend(objc.id, cocoa_window, "contentView", .{});
    objc.msgSend(void, content_view, "setLayer:", .{layer});
    objc.msgSend(void, content_view, "setWantsLayer:", .{objc.YES});

    return layer;
}

/// Keyboard key tokens (`GLFW_KEY_*`). Named after the key's position on a
/// US keyboard layout. Non-exhaustive so any `c_int` GLFW hands back can be
/// converted with `@enumFromInt` safely.
pub const Key = enum(c_int) {
    unknown = -1,

    // Printable keys.
    space = 32,
    apostrophe = 39, // '
    comma = 44, // ,
    minus = 45, // -
    period = 46, // .
    slash = 47, // /
    zero = 48,
    one = 49,
    two = 50,
    three = 51,
    four = 52,
    five = 53,
    six = 54,
    seven = 55,
    eight = 56,
    nine = 57,
    semicolon = 59, // ;
    equal = 61, // =
    a = 65,
    b = 66,
    c = 67,
    d = 68,
    e = 69,
    f = 70,
    g = 71,
    h = 72,
    i = 73,
    j = 74,
    k = 75,
    l = 76,
    m = 77,
    n = 78,
    o = 79,
    p = 80,
    q = 81,
    r = 82,
    s = 83,
    t = 84,
    u = 85,
    v = 86,
    w = 87,
    x = 88,
    y = 89,
    z = 90,
    left_bracket = 91, // [
    backslash = 92, // \
    right_bracket = 93, // ]
    grave_accent = 96, // `
    world_1 = 161, // non-US #1
    world_2 = 162, // non-US #2

    // Function keys.
    escape = 256,
    enter = 257,
    tab = 258,
    backspace = 259,
    insert = 260,
    delete = 261,
    right = 262,
    left = 263,
    down = 264,
    up = 265,
    page_up = 266,
    page_down = 267,
    home = 268,
    end = 269,
    caps_lock = 280,
    scroll_lock = 281,
    num_lock = 282,
    print_screen = 283,
    pause = 284,
    f1 = 290,
    f2 = 291,
    f3 = 292,
    f4 = 293,
    f5 = 294,
    f6 = 295,
    f7 = 296,
    f8 = 297,
    f9 = 298,
    f10 = 299,
    f11 = 300,
    f12 = 301,
    f13 = 302,
    f14 = 303,
    f15 = 304,
    f16 = 305,
    f17 = 306,
    f18 = 307,
    f19 = 308,
    f20 = 309,
    f21 = 310,
    f22 = 311,
    f23 = 312,
    f24 = 313,
    f25 = 314,
    kp_0 = 320,
    kp_1 = 321,
    kp_2 = 322,
    kp_3 = 323,
    kp_4 = 324,
    kp_5 = 325,
    kp_6 = 326,
    kp_7 = 327,
    kp_8 = 328,
    kp_9 = 329,
    kp_decimal = 330,
    kp_divide = 331,
    kp_multiply = 332,
    kp_subtract = 333,
    kp_add = 334,
    kp_enter = 335,
    kp_equal = 336,
    left_shift = 340,
    left_control = 341,
    left_alt = 342,
    left_super = 343,
    right_shift = 344,
    right_control = 345,
    right_alt = 346,
    right_super = 347,
    menu = 348,

    _,

    /// `GLFW_KEY_LAST`.
    pub const last: Key = .menu;
};

const Action = enum(c_int) {
    release = 0,
    press = 1,
    repeat = 2,
};

pub const Modifiers = packed struct(c_int) {
    shift: bool,
    control: bool,
    alt: bool,
    super: bool,
    caps_lock: bool,
    num_lock: bool,
    /// Reserved for future usage.
    __rsv: u26,
};
