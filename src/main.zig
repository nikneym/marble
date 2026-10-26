const std = @import("std");

const marble = @import("marble.zig");
const Style = @import("Style.zig");

const App = marble.Builder(Ctx);

pub const Ctx = struct {
    /// Implemented and called by user.
    pub fn init() Ctx {
        return .{};
    }

    /// Invoked when `update` or `draw` encountered with an error.
    pub fn @"error"(ctx: *Ctx, app: *App, err: anyerror) void {
        _ = ctx;
        _ = app;
        _ = err;
    }

    pub fn load(ctx: *Ctx, app: *App) !void {
        _ = ctx;
        _ = app;
    }

    pub fn update(ctx: *Ctx, app: *App, dt: f32) !void {
        _ = ctx;
        _ = app;
        _ = dt;
    }

    pub fn draw(ctx: *Ctx, app: *App) !void {
        _ = ctx;

        app.setDrawStyle(.fill);
        app.setColor(40, 40, 255, 255);
        app.rect(100, 100, 250, 250);

        app.setColor(255, 40, 40, 255);
        app.setDrawStyle(.stroke);
        app.roundedRect(125, 125, 250, 250, 100, 4, 4, 100);

        app.setDrawStyle(.stroke);
        app.setColor(255, 255, 40, 140);
        app.circle(200, 200, 48);

        app.setStrokeWidth(6);

        app.line(100, 100, 300, 300);

        app.setColor(255, 40, 40, 255);
        app.setStrokeWidth(1);
        app.setDrawStyle(.fill);
    }
};

pub fn main(init: std.process.Init) !void {
    const allocator = init.arena.allocator();

    var ctx = Ctx.init();
    var app = try App.init(&ctx, allocator);
    defer app.deinit();

    try app.run();
}
