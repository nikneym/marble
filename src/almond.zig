const std = @import("std");

const imp = @import("sys/impeller.zig");
const glfw = @import("sys/glfw.zig");
const metal = @import("sys/metal.zig");
const objc = @import("sys/objc.zig");

fn glfw_error_callback(err: c_int, desc: [*c]const u8) callconv(.c) void {
    _ = err;
    _ = desc;
}

pub fn Builder(comptime Ctx: type) type {
    const has_keypressed = @hasDecl(Ctx, "keyPressed");
    const has_keyreleased = @hasDecl(Ctx, "keyReleased");
    const has_mouse_moved = @hasDecl(Ctx, "mouseMoved");

    return struct {
        const Almond = @This();

        ctx: *Ctx,
        window: *glfw.GLFWwindow,

        pub fn init(ctx: *Ctx) !Almond {
            // TODO: assertion.
            _ = glfw.glfwSetErrorCallback(glfw_error_callback);

            try glfw.init();
            errdefer glfw.glfwTerminate();

            const window = try glfw.createWindow(800, 600, "almond");
            errdefer glfw.glfwDestroyWindow(window);

            if (comptime has_keypressed or has_keyreleased) {
                _ = glfw.glfwSetKeyCallback(window, internal_key_fn);
            }

            if (comptime has_mouse_moved) {
                _ = glfw.glfwSetCursorPosCallback(window, internal_cursor_pos_fn);
            }

            return .{
                .ctx = ctx,
                .window = window,
            };
        }

        pub fn deinit(almond: *Almond) void {
            glfw.glfwDestroyWindow(almond.window);
            glfw.glfwTerminate();
        }

        pub fn run(almond: *Almond) !void {
            const window = almond.window;
            // Make app reachable from GLFW callbacks.
            glfw.glfwSetWindowUserPointer(window, almond);

            var last = glfw.glfwGetTime();
            while (!glfw.windowShouldClose(window)) {
                glfw.glfwPollEvents();
                // Calculate dt.
                const now = glfw.glfwGetTime();
                const dt = now - last;
                last = now;
                _ = dt;

                glfw.glfwSwapBuffers(window);
            }
        }

        pub fn getMousePosition(almond: *Almond) struct { f64, f64 } {
            var x: f64, var y: f64 = .{ 0, 0 };
            glfw.glfwGetCursorPos(almond.window, &x, &y);
            return .{ x, y };
        }

        /// Returns a pointer to `App` in GLFW functions.
        /// Only valid after a call to `run`.
        fn getAlmond(window: ?*glfw.GLFWwindow) *Almond {
            return @ptrCast(@alignCast(glfw.glfwGetWindowUserPointer(window)));
        }

        // Internal callbacks.

        fn internal_key_fn(window: ?*glfw.GLFWwindow, key: c_int, scancode: c_int, action: c_int, mods: c_int) callconv(.c) void {
            const almond = getAlmond(window);

            switch (@as(Action, @enumFromInt(action))) {
                inline .press, .repeat => |act| {
                    if (comptime has_keypressed) {
                        @call(.auto, Ctx.keyPressed, .{ almond, @as(Key, @enumFromInt(key)), scancode, @as(Modifiers, @bitCast(mods)), act == .repeat });
                    }
                },
                .release => {
                    if (comptime has_keyreleased) {
                        @call(.auto, Ctx.keyReleased, .{ almond, @as(Key, @enumFromInt(key)), scancode, @as(Modifiers, @bitCast(mods)) });
                    }
                },
            }
        }

        fn internal_cursor_pos_fn(window: ?*glfw.GLFWwindow, x: f64, y: f64) callconv(.c) void {
            const almond = getAlmond(window);
            if (comptime has_mouse_moved) {
                @call(.auto, Ctx.mouseMoved, .{ almond, x, y });
            }
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
