const std = @import("std");

const imp = @import("sys/impeller.zig");
const glfw = @import("sys/glfw.zig");
const metal = @import("sys/metal.zig");
const objc = @import("sys/objc.zig");

const almond = @import("almond.zig");

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

const Almond = almond.Builder(Ctx);

pub const Ctx = struct {
    pub fn init() Ctx {
        return .{};
    }

    pub fn keyPressed(app: *Almond, key: almond.Key, _: c_int, mods: almond.Modifiers, repeat: bool) void {
        _ = app;
        _ = mods;
        _ = key;
        _ = repeat;

        //std.debug.print("{}\t{}\n", .{ key, repeat });
    }

    pub fn keyReleased(app: *Almond, key: almond.Key, _: c_int, _: almond.Modifiers) void {
        _ = app;
        _ = key;
        //std.debug.print("released: {}\n", .{key});
    }

    pub fn mouseMoved(app: *Almond, x: f64, y: f64) void {
        _ = app;
        std.debug.print("x: {}\ty: {}\n", .{ x, y });
    }

    pub fn update(app: *Almond, dt: f64) void {
        _ = app;
        _ = dt;
    }
};

pub fn main() !void {
    var ctx = Ctx.init();

    //const style = almond.createStyle(.{
    //    .color = .rgba(20, 20, 255, 255),
    //});

    var app = try Almond.init(&ctx);
    defer app.deinit();

    try app.run();
}

pub fn main1(init: std.process.Init) !void {
    _ = init;

    //_ = glfw.glfwSetErrorCallback(glfw_error_callback);
    _ = glfw.glfwInit();
    defer glfw.glfwTerminate();

    glfw.glfwWindowHint(glfw.GLFW_CLIENT_API, glfw.GLFW_NO_API);

    var window: *glfw.GLFWwindow = undefined;
    window = glfw.glfwCreateWindow(800, 600, "almond", null, null) orelse return;

    const imp_ctx = imp.ImpellerContextCreateMetalNew(imp.ImpellerGetVersion());
    std.debug.assert(imp_ctx != null);

    const layer = attachMetalLayer(window);

    var dl: imp.ImpellerDisplayList = null;

    const builder = imp.ImpellerDisplayListBuilderNew(null);
    const paint = imp.ImpellerPaintNew();

    // Clear the background to a white color.
    const clear_color = imp.ImpellerColor{ .red = 1.0, .green = 1.0, .blue = 1.0, .alpha = 1.0 };
    imp.ImpellerPaintSetColor(paint, &clear_color);
    imp.ImpellerDisplayListBuilderDrawPaint(builder, paint);

    //rectangle(builder, .{ .red = 0.0, .green = 1.0, .blue = 0.0, .alpha = 1.0 }, .{ .x = 100, .y = 100, .width = 32, .height = 32 });

    dl = imp.ImpellerDisplayListBuilderCreateDisplayListNew(builder);

    //glfw.glfwMakeContextCurrent(window);

    while (glfw.glfwWindowShouldClose(window) != 1) {
        //glfw.glfwPollEvents();
        glfw.glfwWaitEvents();

        // No ARC, drain each frame's autoreleased drawable ourselves.
        const pool = objc.objc_autoreleasePoolPush();
        defer objc.objc_autoreleasePoolPop(pool);

        // React to window resizes.
        //const bounds = objc.msgSend(objc.CGRect, layer, "bounds", .{});
        //objc.msgSend(void, layer, "setDrawableSize:", .{bounds.size});

        const drawable = objc.msgSend(?objc.id, layer, "nextDrawable", .{});
        const surface = imp.ImpellerSurfaceCreateWrappedMetalDrawableNew(imp_ctx, drawable);
        std.debug.assert(surface != null);
        _ = imp.ImpellerSurfaceDrawDisplayList(surface, dl);
        _ = imp.ImpellerSurfacePresent(surface);
        imp.ImpellerSurfaceRelease(surface);
    }
}
