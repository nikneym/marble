const std = @import("std");
const imp = @import("sys/impeller.zig");

const Style = @This();
paint: imp.ImpellerPaint,

pub fn init() Style {
    const paint = imp.ImpellerPaintNew();
    return .{ .paint = paint };
}

fn colorFromBytes(r: u8, g: u8, b: u8, a: u8) imp.ImpellerColor {
    return .{
        .red = @as(f32, @floatFromInt(r)) / 255,
        .green = @as(f32, @floatFromInt(g)) / 255,
        .blue = @as(f32, @floatFromInt(b)) / 255,
        .alpha = @as(f32, @floatFromInt(a)) / 255,
    };
}

pub fn color(style: Style, red: u8, green: u8, blue: u8, alpha: u8) void {
    imp.ImpellerPaintSetColor(style.paint, &colorFromBytes(red, green, blue, alpha));
}

pub const DrawStyle = enum(imp.ImpellerDrawStyle) {
    fill = imp.kImpellerDrawStyleFill,
    stroke = imp.kImpellerDrawStyleStroke,
    stroke_and_fill = imp.kImpellerDrawStyleStrokeAndFill,
};

pub inline fn drawStyle(style: Style, mode: DrawStyle) void {
    return imp.ImpellerPaintSetDrawStyle(style.paint, @backingInt(mode));
}

pub inline fn strokeWidth(style: Style, width: f32) void {
    return imp.ImpellerPaintSetStrokeWidth(style.paint, width);
}

//pub fn stroke(style: Style) void {
//    //imp.ImpellerPaintSetDrawStyle(style.paint, imp.kImpellerDrawStyleStroke);
//    imp.ImpellerPaintSetDrawStyle(style.paint, imp.kImpellerDrawStyleStrokeAndFill);
//    imp.ImpellerPaintSetStrokeWidth(style.paint, 1);
//}
