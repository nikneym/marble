//! Objective-C runtime bindings.

const std = @import("std");
const builtin = @import("builtin");

pub const id = *anyopaque;
pub const Class = *opaque {};
pub const SEL = *opaque {};

pub const BOOL = if (builtin.cpu.arch == .aarch64) bool else i8;
pub const YES: BOOL = if (BOOL == bool) true else 1;
pub const NO: BOOL = if (BOOL == bool) false else 0;

pub const NSUInteger = usize;

pub const CGFloat = f64;
pub const CGPoint = extern struct { x: CGFloat, y: CGFloat };
pub const CGSize = extern struct { width: CGFloat, height: CGFloat };
pub const CGRect = extern struct { origin: CGPoint, size: CGSize };

pub extern fn objc_getClass(name: [*:0]const u8) ?Class;
pub extern fn sel_registerName(name: [*:0]const u8) SEL;
pub extern fn objc_msgSend() void;
pub extern fn objc_autoreleasePoolPush() *anyopaque;
pub extern fn objc_autoreleasePoolPop(pool: *anyopaque) void;

/// Sends `sel` to `receiver`, casting `objc_msgSend` to the exact prototype
/// implied by `Return` and the types in `args`, as arm64 requires. Large
/// struct returns are arm64-only; x86_64 would need `objc_msgSend_stret`.
pub fn msgSend(comptime Return: type, receiver: anytype, sel: [*:0]const u8, args: anytype) Return {
    const arg_types = @typeInfo(@TypeOf(args)).@"struct".field_types;
    const param_types = [_]type{ @TypeOf(receiver), SEL } ++ arg_types[0..arg_types.len].*;
    const param_attrs: [param_types.len]std.lang.Type.Fn.ParamAttributes = @splat(.{});
    const Fn = @Fn(&param_types, &param_attrs, Return, .{ .@"callconv" = .c });
    const func: *const Fn = @ptrCast(&objc_msgSend);
    return @call(.auto, func, .{ receiver, sel_registerName(sel) } ++ args);
}
