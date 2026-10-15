//! Metal bindings.

const objc = @import("objc.zig");

pub const MTLPixelFormatBGRA8Unorm: objc.NSUInteger = 80;

/// Returns a +1 retained `id<MTLDevice>`; the caller must release it.
pub extern fn MTLCreateSystemDefaultDevice() ?objc.id;
