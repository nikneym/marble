pub const GLFW_CLIENT_API = 0x00022001;
pub const GLFW_NO_API = 0;
pub const GLFWglproc = ?*const fn () callconv(.c) void;
pub const struct_GLFWmonitor = opaque {};
pub const GLFWmonitor = struct_GLFWmonitor;
pub const struct_GLFWwindow = opaque {};
pub const GLFWwindow = struct_GLFWwindow;
pub const struct_GLFWcursor = opaque {};
pub const GLFWcursor = struct_GLFWcursor;
pub const GLFWallocatefun = ?*const fn (size: usize, user: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const GLFWreallocatefun = ?*const fn (block: ?*anyopaque, size: usize, user: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const GLFWdeallocatefun = ?*const fn (block: ?*anyopaque, user: ?*anyopaque) callconv(.c) void;
pub const GLFWerrorfun = ?*const fn (error_code: c_int, description: [*c]const u8) callconv(.c) void;
pub const GLFWwindowposfun = ?*const fn (window: ?*GLFWwindow, xpos: c_int, ypos: c_int) callconv(.c) void;
pub const GLFWwindowsizefun = ?*const fn (window: ?*GLFWwindow, width: c_int, height: c_int) callconv(.c) void;
pub const GLFWwindowclosefun = ?*const fn (window: ?*GLFWwindow) callconv(.c) void;
pub const GLFWwindowrefreshfun = ?*const fn (window: ?*GLFWwindow) callconv(.c) void;
pub const GLFWwindowfocusfun = ?*const fn (window: ?*GLFWwindow, focused: c_int) callconv(.c) void;
pub const GLFWwindowiconifyfun = ?*const fn (window: ?*GLFWwindow, iconified: c_int) callconv(.c) void;
pub const GLFWwindowmaximizefun = ?*const fn (window: ?*GLFWwindow, maximized: c_int) callconv(.c) void;
pub const GLFWframebuffersizefun = ?*const fn (window: ?*GLFWwindow, width: c_int, height: c_int) callconv(.c) void;
pub const GLFWwindowcontentscalefun = ?*const fn (window: ?*GLFWwindow, xscale: f32, yscale: f32) callconv(.c) void;
pub const GLFWmousebuttonfun = ?*const fn (window: ?*GLFWwindow, button: c_int, action: c_int, mods: c_int) callconv(.c) void;
pub const GLFWcursorposfun = ?*const fn (window: ?*GLFWwindow, xpos: f64, ypos: f64) callconv(.c) void;
pub const GLFWcursorenterfun = ?*const fn (window: ?*GLFWwindow, entered: c_int) callconv(.c) void;
pub const GLFWscrollfun = ?*const fn (window: ?*GLFWwindow, xoffset: f64, yoffset: f64) callconv(.c) void;
pub const GLFWkeyfun = ?*const fn (window: ?*GLFWwindow, key: c_int, scancode: c_int, action: c_int, mods: c_int) callconv(.c) void;
pub const GLFWcharfun = ?*const fn (window: ?*GLFWwindow, codepoint: c_uint) callconv(.c) void;
pub const GLFWcharmodsfun = ?*const fn (window: ?*GLFWwindow, codepoint: c_uint, mods: c_int) callconv(.c) void;
pub const GLFWdropfun = ?*const fn (window: ?*GLFWwindow, path_count: c_int, paths: [*c][*c]const u8) callconv(.c) void;
pub const GLFWmonitorfun = ?*const fn (monitor: ?*GLFWmonitor, event: c_int) callconv(.c) void;
pub const GLFWjoystickfun = ?*const fn (jid: c_int, event: c_int) callconv(.c) void;
pub const struct_GLFWvidmode = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    redBits: c_int = 0,
    greenBits: c_int = 0,
    blueBits: c_int = 0,
    refreshRate: c_int = 0,
};
pub const GLFWvidmode = struct_GLFWvidmode;
pub const struct_GLFWgammaramp = extern struct {
    red: [*c]c_ushort = null,
    green: [*c]c_ushort = null,
    blue: [*c]c_ushort = null,
    size: c_uint = 0,
};
pub const GLFWgammaramp = struct_GLFWgammaramp;
pub const struct_GLFWimage = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    pixels: [*c]u8 = null,
};
pub const GLFWimage = struct_GLFWimage;
pub const struct_GLFWgamepadstate = extern struct {
    buttons: [15]u8 = @import("std").mem.zeroes([15]u8),
    axes: [6]f32 = @import("std").mem.zeroes([6]f32),
};
pub const GLFWgamepadstate = struct_GLFWgamepadstate;
pub const struct_GLFWallocator = extern struct {
    allocate: GLFWallocatefun = null,
    reallocate: GLFWreallocatefun = null,
    deallocate: GLFWdeallocatefun = null,
    user: ?*anyopaque = null,
};
pub const GLFWallocator = struct_GLFWallocator;
pub extern fn glfwInit() c_int;
pub extern fn glfwTerminate() void;
pub extern fn glfwInitHint(hint: c_int, value: c_int) void;
pub extern fn glfwInitAllocator(allocator: [*c]const GLFWallocator) void;
pub extern fn glfwGetVersion(major: [*c]c_int, minor: [*c]c_int, rev: [*c]c_int) void;
pub extern fn glfwGetVersionString() [*c]const u8;
pub extern fn glfwGetError(description: [*c][*c]const u8) c_int;
pub extern fn glfwSetErrorCallback(callback: GLFWerrorfun) GLFWerrorfun;
pub extern fn glfwGetPlatform() c_int;
pub extern fn glfwPlatformSupported(platform: c_int) c_int;
pub extern fn glfwGetMonitors(count: [*c]c_int) [*c]?*GLFWmonitor;
pub extern fn glfwGetPrimaryMonitor() ?*GLFWmonitor;
pub extern fn glfwGetMonitorPos(monitor: ?*GLFWmonitor, xpos: [*c]c_int, ypos: [*c]c_int) void;
pub extern fn glfwGetMonitorWorkarea(monitor: ?*GLFWmonitor, xpos: [*c]c_int, ypos: [*c]c_int, width: [*c]c_int, height: [*c]c_int) void;
pub extern fn glfwGetMonitorPhysicalSize(monitor: ?*GLFWmonitor, widthMM: [*c]c_int, heightMM: [*c]c_int) void;
pub extern fn glfwGetMonitorContentScale(monitor: ?*GLFWmonitor, xscale: [*c]f32, yscale: [*c]f32) void;
pub extern fn glfwGetMonitorName(monitor: ?*GLFWmonitor) [*c]const u8;
pub extern fn glfwSetMonitorUserPointer(monitor: ?*GLFWmonitor, pointer: ?*anyopaque) void;
pub extern fn glfwGetMonitorUserPointer(monitor: ?*GLFWmonitor) ?*anyopaque;
pub extern fn glfwSetMonitorCallback(callback: GLFWmonitorfun) GLFWmonitorfun;
pub extern fn glfwGetVideoModes(monitor: ?*GLFWmonitor, count: [*c]c_int) [*c]const GLFWvidmode;
pub extern fn glfwGetVideoMode(monitor: ?*GLFWmonitor) [*c]const GLFWvidmode;
pub extern fn glfwSetGamma(monitor: ?*GLFWmonitor, gamma: f32) void;
pub extern fn glfwGetGammaRamp(monitor: ?*GLFWmonitor) [*c]const GLFWgammaramp;
pub extern fn glfwSetGammaRamp(monitor: ?*GLFWmonitor, ramp: [*c]const GLFWgammaramp) void;
pub extern fn glfwDefaultWindowHints() void;
pub extern fn glfwWindowHint(hint: c_int, value: c_int) void;
pub extern fn glfwWindowHintString(hint: c_int, value: [*c]const u8) void;
pub extern fn glfwCreateWindow(width: c_int, height: c_int, title: [*c]const u8, monitor: ?*GLFWmonitor, share: ?*GLFWwindow) ?*GLFWwindow;
pub extern fn glfwDestroyWindow(window: ?*GLFWwindow) void;
pub extern fn glfwWindowShouldClose(window: ?*GLFWwindow) c_int;
pub extern fn glfwSetWindowShouldClose(window: ?*GLFWwindow, value: c_int) void;
pub extern fn glfwGetWindowTitle(window: ?*GLFWwindow) [*c]const u8;
pub extern fn glfwSetWindowTitle(window: ?*GLFWwindow, title: [*c]const u8) void;
pub extern fn glfwSetWindowIcon(window: ?*GLFWwindow, count: c_int, images: [*c]const GLFWimage) void;
pub extern fn glfwGetWindowPos(window: ?*GLFWwindow, xpos: [*c]c_int, ypos: [*c]c_int) void;
pub extern fn glfwSetWindowPos(window: ?*GLFWwindow, xpos: c_int, ypos: c_int) void;
pub extern fn glfwGetWindowSize(window: ?*GLFWwindow, width: [*c]c_int, height: [*c]c_int) void;
pub extern fn glfwSetWindowSizeLimits(window: ?*GLFWwindow, minwidth: c_int, minheight: c_int, maxwidth: c_int, maxheight: c_int) void;
pub extern fn glfwSetWindowAspectRatio(window: ?*GLFWwindow, numer: c_int, denom: c_int) void;
pub extern fn glfwSetWindowSize(window: ?*GLFWwindow, width: c_int, height: c_int) void;
pub extern fn glfwGetFramebufferSize(window: ?*GLFWwindow, width: [*c]c_int, height: [*c]c_int) void;
pub extern fn glfwGetWindowFrameSize(window: ?*GLFWwindow, left: [*c]c_int, top: [*c]c_int, right: [*c]c_int, bottom: [*c]c_int) void;
pub extern fn glfwGetWindowContentScale(window: ?*GLFWwindow, xscale: [*c]f32, yscale: [*c]f32) void;
pub extern fn glfwGetWindowOpacity(window: ?*GLFWwindow) f32;
pub extern fn glfwSetWindowOpacity(window: ?*GLFWwindow, opacity: f32) void;
pub extern fn glfwIconifyWindow(window: ?*GLFWwindow) void;
pub extern fn glfwRestoreWindow(window: ?*GLFWwindow) void;
pub extern fn glfwMaximizeWindow(window: ?*GLFWwindow) void;
pub extern fn glfwShowWindow(window: ?*GLFWwindow) void;
pub extern fn glfwHideWindow(window: ?*GLFWwindow) void;
pub extern fn glfwFocusWindow(window: ?*GLFWwindow) void;
pub extern fn glfwRequestWindowAttention(window: ?*GLFWwindow) void;
pub extern fn glfwGetWindowMonitor(window: ?*GLFWwindow) ?*GLFWmonitor;
pub extern fn glfwSetWindowMonitor(window: ?*GLFWwindow, monitor: ?*GLFWmonitor, xpos: c_int, ypos: c_int, width: c_int, height: c_int, refreshRate: c_int) void;
pub extern fn glfwGetWindowAttrib(window: ?*GLFWwindow, attrib: c_int) c_int;
pub extern fn glfwSetWindowAttrib(window: ?*GLFWwindow, attrib: c_int, value: c_int) void;
pub extern fn glfwSetWindowUserPointer(window: ?*GLFWwindow, pointer: ?*anyopaque) void;
pub extern fn glfwGetWindowUserPointer(window: ?*GLFWwindow) ?*anyopaque;
pub extern fn glfwSetWindowPosCallback(window: ?*GLFWwindow, callback: GLFWwindowposfun) GLFWwindowposfun;
pub extern fn glfwSetWindowSizeCallback(window: ?*GLFWwindow, callback: GLFWwindowsizefun) GLFWwindowsizefun;
pub extern fn glfwSetWindowCloseCallback(window: ?*GLFWwindow, callback: GLFWwindowclosefun) GLFWwindowclosefun;
pub extern fn glfwSetWindowRefreshCallback(window: ?*GLFWwindow, callback: GLFWwindowrefreshfun) GLFWwindowrefreshfun;
pub extern fn glfwSetWindowFocusCallback(window: ?*GLFWwindow, callback: GLFWwindowfocusfun) GLFWwindowfocusfun;
pub extern fn glfwSetWindowIconifyCallback(window: ?*GLFWwindow, callback: GLFWwindowiconifyfun) GLFWwindowiconifyfun;
pub extern fn glfwSetWindowMaximizeCallback(window: ?*GLFWwindow, callback: GLFWwindowmaximizefun) GLFWwindowmaximizefun;
pub extern fn glfwSetFramebufferSizeCallback(window: ?*GLFWwindow, callback: GLFWframebuffersizefun) GLFWframebuffersizefun;
pub extern fn glfwSetWindowContentScaleCallback(window: ?*GLFWwindow, callback: GLFWwindowcontentscalefun) GLFWwindowcontentscalefun;
pub extern fn glfwPollEvents() void;
pub extern fn glfwWaitEvents() void;
pub extern fn glfwWaitEventsTimeout(timeout: f64) void;
pub extern fn glfwPostEmptyEvent() void;
pub extern fn glfwGetInputMode(window: ?*GLFWwindow, mode: c_int) c_int;
pub extern fn glfwSetInputMode(window: ?*GLFWwindow, mode: c_int, value: c_int) void;
pub extern fn glfwRawMouseMotionSupported() c_int;
pub extern fn glfwGetKeyName(key: c_int, scancode: c_int) [*c]const u8;
pub extern fn glfwGetKeyScancode(key: c_int) c_int;
pub extern fn glfwGetKey(window: ?*GLFWwindow, key: c_int) c_int;
pub extern fn glfwGetMouseButton(window: ?*GLFWwindow, button: c_int) c_int;
pub extern fn glfwGetCursorPos(window: ?*GLFWwindow, xpos: [*c]f64, ypos: [*c]f64) void;
pub extern fn glfwSetCursorPos(window: ?*GLFWwindow, xpos: f64, ypos: f64) void;
pub extern fn glfwCreateCursor(image: [*c]const GLFWimage, xhot: c_int, yhot: c_int) ?*GLFWcursor;
pub extern fn glfwCreateStandardCursor(shape: c_int) ?*GLFWcursor;
pub extern fn glfwDestroyCursor(cursor: ?*GLFWcursor) void;
pub extern fn glfwSetCursor(window: ?*GLFWwindow, cursor: ?*GLFWcursor) void;
pub extern fn glfwSetKeyCallback(window: ?*GLFWwindow, callback: GLFWkeyfun) GLFWkeyfun;
pub extern fn glfwSetCharCallback(window: ?*GLFWwindow, callback: GLFWcharfun) GLFWcharfun;
pub extern fn glfwSetCharModsCallback(window: ?*GLFWwindow, callback: GLFWcharmodsfun) GLFWcharmodsfun;
pub extern fn glfwSetMouseButtonCallback(window: ?*GLFWwindow, callback: GLFWmousebuttonfun) GLFWmousebuttonfun;
pub extern fn glfwSetCursorPosCallback(window: ?*GLFWwindow, callback: GLFWcursorposfun) GLFWcursorposfun;
pub extern fn glfwSetCursorEnterCallback(window: ?*GLFWwindow, callback: GLFWcursorenterfun) GLFWcursorenterfun;
pub extern fn glfwSetScrollCallback(window: ?*GLFWwindow, callback: GLFWscrollfun) GLFWscrollfun;
pub extern fn glfwSetDropCallback(window: ?*GLFWwindow, callback: GLFWdropfun) GLFWdropfun;
pub extern fn glfwJoystickPresent(jid: c_int) c_int;
pub extern fn glfwGetJoystickAxes(jid: c_int, count: [*c]c_int) [*c]const f32;
pub extern fn glfwGetJoystickButtons(jid: c_int, count: [*c]c_int) [*c]const u8;
pub extern fn glfwGetJoystickHats(jid: c_int, count: [*c]c_int) [*c]const u8;
pub extern fn glfwGetJoystickName(jid: c_int) [*c]const u8;
pub extern fn glfwGetJoystickGUID(jid: c_int) [*c]const u8;
pub extern fn glfwSetJoystickUserPointer(jid: c_int, pointer: ?*anyopaque) void;
pub extern fn glfwGetJoystickUserPointer(jid: c_int) ?*anyopaque;
pub extern fn glfwJoystickIsGamepad(jid: c_int) c_int;
pub extern fn glfwSetJoystickCallback(callback: GLFWjoystickfun) GLFWjoystickfun;
pub extern fn glfwUpdateGamepadMappings(string: [*c]const u8) c_int;
pub extern fn glfwGetGamepadName(jid: c_int) [*c]const u8;
pub extern fn glfwGetGamepadState(jid: c_int, state: [*c]GLFWgamepadstate) c_int;
pub extern fn glfwSetClipboardString(window: ?*GLFWwindow, string: [*c]const u8) void;
pub extern fn glfwGetClipboardString(window: ?*GLFWwindow) [*c]const u8;
pub extern fn glfwGetTime() f64;
pub extern fn glfwSetTime(time: f64) void;
pub extern fn glfwGetTimerValue() u64;
pub extern fn glfwGetTimerFrequency() u64;
pub extern fn glfwMakeContextCurrent(window: ?*GLFWwindow) void;
pub extern fn glfwGetCurrentContext() ?*GLFWwindow;
pub extern fn glfwSwapBuffers(window: ?*GLFWwindow) void;
pub extern fn glfwSwapInterval(interval: c_int) void;
pub extern fn glfwExtensionSupported(extension: [*c]const u8) c_int;
pub extern fn glfwGetProcAddress(procname: [*c]const u8) GLFWglproc;
pub extern fn glfwVulkanSupported() c_int;
pub extern fn glfwGetRequiredInstanceExtensions(count: [*c]u32) [*c][*c]const u8;
// glfw3native.h
pub extern fn glfwGetCocoaWindow(window: ?*GLFWwindow) ?*anyopaque;

const GLFW_TRUE = 1;
const GLFW_FALSE = 0;

const GLFW_RELEASE = 0;
const GLFW_PRESS = 1;
const GLFW_REPEAT = 2;

const GLFW_NO_ERROR = 0;
const GLFW_NOT_INITIALIZED = 0x00010001;
const GLFW_NO_CURRENT_CONTEXT = 0x00010002;
const GLFW_INVALID_ENUM = 0x00010003;
const GLFW_INVALID_VALUE = 0x00010004;
const GLFW_OUT_OF_MEMORY = 0x00010005;
const GLFW_API_UNAVAILABLE = 0x00010006;
const GLFW_VERSION_UNAVAILABLE = 0x00010007;
const GLFW_PLATFORM_ERROR = 0x00010008;
const GLFW_FORMAT_UNAVAILABLE = 0x00010009;
const GLFW_NO_WINDOW_CONTEXT = 0x0001000A;
const GLFW_CURSOR_UNAVAILABLE = 0x0001000B;
const GLFW_FEATURE_UNAVAILABLE = 0x0001000C;
const GLFW_FEATURE_UNIMPLEMENTED = 0x0001000D;
const GLFW_PLATFORM_UNAVAILABLE = 0x0001000E;

pub const Error = error{
    NotInitialized,
    NoCurrentContext,
    InvalidEnum,
    InvalidValue,
    OutOfMemory,
    ApiUnavailable,
    VersionUnavailable,
    Platform,
    FormatUnavailable,
    NoWindowContext,
    CursorUnavailable,
    FeatureUnavailable,
    FeatureUnimplemented,
    PlatformUnavailable,
};

pub fn getError() Error!void {
    const code = glfwGetError(null);
    return switch (code) {
        GLFW_NO_ERROR => {},
        GLFW_NOT_INITIALIZED => error.NotInitialized,
        GLFW_NO_CURRENT_CONTEXT => error.NoCurrentContext,
        GLFW_INVALID_ENUM => error.InvalidEnum,
        GLFW_INVALID_VALUE => error.InvalidValue,
        GLFW_OUT_OF_MEMORY => error.OutOfMemory,
        GLFW_API_UNAVAILABLE => error.ApiUnavailable,
        GLFW_VERSION_UNAVAILABLE => error.VersionUnavailable,
        GLFW_PLATFORM_ERROR => error.Platform,
        GLFW_FORMAT_UNAVAILABLE => error.FormatUnavailable,
        GLFW_NO_WINDOW_CONTEXT => error.NoWindowContext,
        GLFW_CURSOR_UNAVAILABLE => error.CursorUnavailable,
        GLFW_FEATURE_UNAVAILABLE => error.FeatureUnavailable,
        GLFW_FEATURE_UNIMPLEMENTED => error.FeatureUnimplemented,
        GLFW_PLATFORM_UNAVAILABLE => error.PlatformUnavailable,
        else => unreachable,
    };
}

// TODO: Add `initWithAllocator` variant.
pub fn init() Error!void {
    if (glfwInit() == GLFW_TRUE) return;
    return getError();
}

pub fn createWindow(width: u31, height: u31, title: [:0]const u8) Error!*GLFWwindow {
    const window = glfwCreateWindow(width, height, title.ptr, null, null);
    try getError();
    return window.?;
}

pub inline fn windowShouldClose(window: *GLFWwindow) bool {
    return glfwWindowShouldClose(window) == GLFW_TRUE;
}
