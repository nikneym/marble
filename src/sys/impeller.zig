pub const struct_ImpellerContext_ = opaque {};
pub const ImpellerContext = ?*struct_ImpellerContext_;
pub const struct_ImpellerDisplayList_ = opaque {};
pub const ImpellerDisplayList = ?*struct_ImpellerDisplayList_;
pub const struct_ImpellerDisplayListBuilder_ = opaque {};
pub const ImpellerDisplayListBuilder = ?*struct_ImpellerDisplayListBuilder_;
pub const struct_ImpellerPaint_ = opaque {};
pub const ImpellerPaint = ?*struct_ImpellerPaint_;
pub const struct_ImpellerColorFilter_ = opaque {};
pub const ImpellerColorFilter = ?*struct_ImpellerColorFilter_;
pub const struct_ImpellerColorSource_ = opaque {};
pub const ImpellerColorSource = ?*struct_ImpellerColorSource_;
pub const struct_ImpellerImageFilter_ = opaque {};
pub const ImpellerImageFilter = ?*struct_ImpellerImageFilter_;
pub const struct_ImpellerMaskFilter_ = opaque {};
pub const ImpellerMaskFilter = ?*struct_ImpellerMaskFilter_;
pub const struct_ImpellerTypographyContext_ = opaque {};
pub const ImpellerTypographyContext = ?*struct_ImpellerTypographyContext_;
pub const struct_ImpellerParagraph_ = opaque {};
pub const ImpellerParagraph = ?*struct_ImpellerParagraph_;
pub const struct_ImpellerParagraphBuilder_ = opaque {};
pub const ImpellerParagraphBuilder = ?*struct_ImpellerParagraphBuilder_;
pub const struct_ImpellerParagraphStyle_ = opaque {};
pub const ImpellerParagraphStyle = ?*struct_ImpellerParagraphStyle_;
pub const struct_ImpellerLineMetrics_ = opaque {};
pub const ImpellerLineMetrics = ?*struct_ImpellerLineMetrics_;
pub const struct_ImpellerGlyphInfo_ = opaque {};
pub const ImpellerGlyphInfo = ?*struct_ImpellerGlyphInfo_;
pub const struct_ImpellerPath_ = opaque {};
pub const ImpellerPath = ?*struct_ImpellerPath_;
pub const struct_ImpellerPathBuilder_ = opaque {};
pub const ImpellerPathBuilder = ?*struct_ImpellerPathBuilder_;
pub const struct_ImpellerSurface_ = opaque {};
pub const ImpellerSurface = ?*struct_ImpellerSurface_;
pub const struct_ImpellerTexture_ = opaque {};
pub const ImpellerTexture = ?*struct_ImpellerTexture_;
pub const struct_ImpellerVulkanSwapchain_ = opaque {};
pub const ImpellerVulkanSwapchain = ?*struct_ImpellerVulkanSwapchain_;
pub const struct_ImpellerFragmentProgram_ = opaque {};
pub const ImpellerFragmentProgram = ?*struct_ImpellerFragmentProgram_;
pub const ImpellerCallback = ?*const fn (user_data: ?*anyopaque) callconv(.c) void;
pub const ImpellerProcAddressCallback = ?*const fn (proc_name: [*c]const u8, user_data: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const ImpellerVulkanProcAddressCallback = ?*const fn (vulkan_instance: ?*anyopaque, vulkan_proc_name: [*c]const u8, user_data: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const enum_ImpellerFillType = c_uint;
pub const ImpellerFillType = enum_ImpellerFillType;
pub const enum_ImpellerClipOperation = c_uint;
pub const ImpellerClipOperation = enum_ImpellerClipOperation;
pub const enum_ImpellerBlendMode = c_uint;
pub const ImpellerBlendMode = enum_ImpellerBlendMode;
pub const enum_ImpellerDrawStyle = c_uint;
pub const ImpellerDrawStyle = enum_ImpellerDrawStyle;
pub const enum_ImpellerStrokeCap = c_uint;
pub const ImpellerStrokeCap = enum_ImpellerStrokeCap;
pub const kImpellerStrokeCapButt: ImpellerStrokeCap = 0;
pub const kImpellerStrokeCapRound: ImpellerStrokeCap = 1;
pub const kImpellerStrokeCapSquare: ImpellerStrokeCap = 2;
pub const enum_ImpellerStrokeJoin = c_uint;
pub const ImpellerStrokeJoin = enum_ImpellerStrokeJoin;
pub const enum_ImpellerPixelFormat = c_uint;
pub const ImpellerPixelFormat = enum_ImpellerPixelFormat;
pub const enum_ImpellerTextureSampling = c_uint;
pub const ImpellerTextureSampling = enum_ImpellerTextureSampling;
pub const enum_ImpellerTileMode = c_uint;
pub const ImpellerTileMode = enum_ImpellerTileMode;
pub const enum_ImpellerBlurStyle = c_uint;
pub const ImpellerBlurStyle = enum_ImpellerBlurStyle;
pub const enum_ImpellerColorSpace = c_uint;
pub const ImpellerColorSpace = enum_ImpellerColorSpace;
pub const enum_ImpellerFontWeight = c_uint;
pub const ImpellerFontWeight = enum_ImpellerFontWeight;
pub const enum_ImpellerFontStyle = c_uint;
pub const ImpellerFontStyle = enum_ImpellerFontStyle;
pub const enum_ImpellerTextAlignment = c_uint;
pub const ImpellerTextAlignment = enum_ImpellerTextAlignment;
pub const enum_ImpellerTextDirection = c_uint;
pub const ImpellerTextDirection = enum_ImpellerTextDirection;
pub const enum_ImpellerTextDecorationStyle = c_uint;
pub const ImpellerTextDecorationStyle = enum_ImpellerTextDecorationStyle;
pub const struct_ImpellerRect = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    width: f32 = 0,
    height: f32 = 0,
};
pub const ImpellerRect = struct_ImpellerRect;
pub const struct_ImpellerPoint = extern struct {
    x: f32 = 0,
    y: f32 = 0,
};
pub const ImpellerPoint = struct_ImpellerPoint;
pub const struct_ImpellerISize = extern struct {
    width: i64 = 0,
    height: i64 = 0,
};
pub const ImpellerISize = struct_ImpellerISize;
pub const struct_ImpellerRange = extern struct {
    start: u64 = 0,
    end: u64 = 0,
};
pub const ImpellerRange = struct_ImpellerRange;
pub const struct_ImpellerMatrix = extern struct {
    m: [16]f32 = @import("std").mem.zeroes([16]f32),
};
pub const ImpellerMatrix = struct_ImpellerMatrix;
pub const struct_ImpellerColorMatrix = extern struct {
    m: [20]f32 = @import("std").mem.zeroes([20]f32),
};
pub const ImpellerColorMatrix = struct_ImpellerColorMatrix;
pub const struct_ImpellerRoundingRadii = extern struct {
    top_left: ImpellerPoint = @import("std").mem.zeroes(ImpellerPoint),
    bottom_left: ImpellerPoint = @import("std").mem.zeroes(ImpellerPoint),
    top_right: ImpellerPoint = @import("std").mem.zeroes(ImpellerPoint),
    bottom_right: ImpellerPoint = @import("std").mem.zeroes(ImpellerPoint),
};
pub const ImpellerRoundingRadii = struct_ImpellerRoundingRadii;
pub const struct_ImpellerColor = extern struct {
    red: f32 = 0,
    green: f32 = 0,
    blue: f32 = 0,
    alpha: f32 = 0,
    color_space: ImpellerColorSpace = @import("std").mem.zeroes(ImpellerColorSpace),
};
pub const ImpellerColor = struct_ImpellerColor;
pub const struct_ImpellerTextureDescriptor = extern struct {
    pixel_format: ImpellerPixelFormat = @import("std").mem.zeroes(ImpellerPixelFormat),
    size: ImpellerISize = @import("std").mem.zeroes(ImpellerISize),
    mip_count: u32 = 0,
};
pub const ImpellerTextureDescriptor = struct_ImpellerTextureDescriptor;
pub const struct_ImpellerMapping = extern struct {
    data: [*c]const u8 = null,
    length: u64 = 0,
    on_release: ImpellerCallback = null,
};
pub const ImpellerMapping = struct_ImpellerMapping;
pub const struct_ImpellerContextVulkanSettings = extern struct {
    user_data: ?*anyopaque = null,
    proc_address_callback: ImpellerVulkanProcAddressCallback = null,
    enable_vulkan_validation: bool = false,
};
pub const ImpellerContextVulkanSettings = struct_ImpellerContextVulkanSettings;
pub const struct_ImpellerContextVulkanInfo = extern struct {
    vk_instance: ?*anyopaque = null,
    vk_physical_device: ?*anyopaque = null,
    vk_logical_device: ?*anyopaque = null,
    graphics_queue_family_index: u32 = 0,
    graphics_queue_index: u32 = 0,
};
pub const ImpellerContextVulkanInfo = struct_ImpellerContextVulkanInfo;
pub const struct_ImpellerTextDecoration = extern struct {
    types: c_int = 0,
    color: ImpellerColor = @import("std").mem.zeroes(ImpellerColor),
    style: ImpellerTextDecorationStyle = @import("std").mem.zeroes(ImpellerTextDecorationStyle),
    thickness_multiplier: f32 = 0,
};
pub const ImpellerTextDecoration = struct_ImpellerTextDecoration;
pub extern fn ImpellerGetVersion() u32;
pub extern fn ImpellerContextCreateOpenGLESNew(version: u32, gl_proc_address_callback: ImpellerProcAddressCallback, gl_proc_address_callback_user_data: ?*anyopaque) ImpellerContext;
pub extern fn ImpellerContextCreateMetalNew(version: u32) ImpellerContext;
pub extern fn ImpellerContextCreateVulkanNew(version: u32, settings: [*c]const ImpellerContextVulkanSettings) ImpellerContext;
pub extern fn ImpellerContextRetain(context: ImpellerContext) void;
pub extern fn ImpellerContextRelease(context: ImpellerContext) void;
pub extern fn ImpellerContextGetVulkanInfo(context: ImpellerContext, out_vulkan_info: [*c]ImpellerContextVulkanInfo) bool;
pub extern fn ImpellerVulkanSwapchainCreateNew(context: ImpellerContext, vulkan_surface_khr: ?*anyopaque) ImpellerVulkanSwapchain;
pub extern fn ImpellerVulkanSwapchainRetain(swapchain: ImpellerVulkanSwapchain) void;
pub extern fn ImpellerVulkanSwapchainRelease(swapchain: ImpellerVulkanSwapchain) void;
pub extern fn ImpellerVulkanSwapchainAcquireNextSurfaceNew(swapchain: ImpellerVulkanSwapchain) ImpellerSurface;
pub extern fn ImpellerSurfaceCreateWrappedFBONew(context: ImpellerContext, fbo: u64, format: ImpellerPixelFormat, size: [*c]const ImpellerISize) ImpellerSurface;
pub extern fn ImpellerSurfaceCreateWrappedMetalDrawableNew(context: ImpellerContext, metal_drawable: ?*anyopaque) ImpellerSurface;
pub extern fn ImpellerSurfaceRetain(surface: ImpellerSurface) void;
pub extern fn ImpellerSurfaceRelease(surface: ImpellerSurface) void;
pub extern fn ImpellerSurfaceDrawDisplayList(surface: ImpellerSurface, display_list: ImpellerDisplayList) bool;
pub extern fn ImpellerSurfacePresent(surface: ImpellerSurface) bool;
pub extern fn ImpellerPathRetain(path: ImpellerPath) void;
pub extern fn ImpellerPathRelease(path: ImpellerPath) void;
pub extern fn ImpellerPathGetBounds(path: ImpellerPath, out_bounds: [*c]ImpellerRect) void;
pub extern fn ImpellerPathBuilderNew(...) ImpellerPathBuilder;
pub extern fn ImpellerPathBuilderRetain(builder: ImpellerPathBuilder) void;
pub extern fn ImpellerPathBuilderRelease(builder: ImpellerPathBuilder) void;
pub extern fn ImpellerPathBuilderMoveTo(builder: ImpellerPathBuilder, location: [*c]const ImpellerPoint) void;
pub extern fn ImpellerPathBuilderLineTo(builder: ImpellerPathBuilder, location: [*c]const ImpellerPoint) void;
pub extern fn ImpellerPathBuilderQuadraticCurveTo(builder: ImpellerPathBuilder, control_point: [*c]const ImpellerPoint, end_point: [*c]const ImpellerPoint) void;
pub extern fn ImpellerPathBuilderCubicCurveTo(builder: ImpellerPathBuilder, control_point_1: [*c]const ImpellerPoint, control_point_2: [*c]const ImpellerPoint, end_point: [*c]const ImpellerPoint) void;
pub extern fn ImpellerPathBuilderAddRect(builder: ImpellerPathBuilder, rect: [*c]const ImpellerRect) void;
pub extern fn ImpellerPathBuilderAddArc(builder: ImpellerPathBuilder, oval_bounds: [*c]const ImpellerRect, start_angle_degrees: f32, end_angle_degrees: f32) void;
pub extern fn ImpellerPathBuilderAddOval(builder: ImpellerPathBuilder, oval_bounds: [*c]const ImpellerRect) void;
pub extern fn ImpellerPathBuilderAddRoundedRect(builder: ImpellerPathBuilder, rect: [*c]const ImpellerRect, rounding_radii: [*c]const ImpellerRoundingRadii) void;
pub extern fn ImpellerPathBuilderClose(builder: ImpellerPathBuilder) void;
pub extern fn ImpellerPathBuilderCopyPathNew(builder: ImpellerPathBuilder, fill: ImpellerFillType) ImpellerPath;
pub extern fn ImpellerPathBuilderTakePathNew(builder: ImpellerPathBuilder, fill: ImpellerFillType) ImpellerPath;
pub extern fn ImpellerPaintNew() ImpellerPaint;
pub extern fn ImpellerPaintRetain(paint: ImpellerPaint) void;
pub extern fn ImpellerPaintRelease(paint: ImpellerPaint) void;
pub extern fn ImpellerPaintSetColor(paint: ImpellerPaint, color: [*c]const ImpellerColor) void;
pub extern fn ImpellerPaintSetBlendMode(paint: ImpellerPaint, mode: ImpellerBlendMode) void;
pub extern fn ImpellerPaintSetDrawStyle(paint: ImpellerPaint, style: ImpellerDrawStyle) void;
pub extern fn ImpellerPaintSetStrokeCap(paint: ImpellerPaint, cap: ImpellerStrokeCap) void;
pub extern fn ImpellerPaintSetStrokeJoin(paint: ImpellerPaint, join: ImpellerStrokeJoin) void;
pub extern fn ImpellerPaintSetStrokeWidth(paint: ImpellerPaint, width: f32) void;
pub extern fn ImpellerPaintSetStrokeMiter(paint: ImpellerPaint, miter: f32) void;
pub extern fn ImpellerPaintSetColorFilter(paint: ImpellerPaint, color_filter: ImpellerColorFilter) void;
pub extern fn ImpellerPaintSetColorSource(paint: ImpellerPaint, color_source: ImpellerColorSource) void;
pub extern fn ImpellerPaintSetImageFilter(paint: ImpellerPaint, image_filter: ImpellerImageFilter) void;
pub extern fn ImpellerPaintSetMaskFilter(paint: ImpellerPaint, mask_filter: ImpellerMaskFilter) void;
pub extern fn ImpellerTextureCreateWithContentsNew(context: ImpellerContext, descriptor: [*c]const ImpellerTextureDescriptor, contents: [*c]const ImpellerMapping, contents_on_release_user_data: ?*anyopaque) ImpellerTexture;
pub extern fn ImpellerTextureCreateWithOpenGLTextureHandleNew(context: ImpellerContext, descriptor: [*c]const ImpellerTextureDescriptor, handle: u64) ImpellerTexture;
pub extern fn ImpellerTextureRetain(texture: ImpellerTexture) void;
pub extern fn ImpellerTextureRelease(texture: ImpellerTexture) void;
pub extern fn ImpellerTextureGetOpenGLHandle(texture: ImpellerTexture) u64;
pub extern fn ImpellerFragmentProgramNew(data: [*c]const ImpellerMapping, data_release_user_data: ?*anyopaque) ImpellerFragmentProgram;
pub extern fn ImpellerFragmentProgramRetain(fragment_program: ImpellerFragmentProgram) void;
pub extern fn ImpellerFragmentProgramRelease(fragment_program: ImpellerFragmentProgram) void;
pub extern fn ImpellerColorSourceRetain(color_source: ImpellerColorSource) void;
pub extern fn ImpellerColorSourceRelease(color_source: ImpellerColorSource) void;
pub extern fn ImpellerColorSourceCreateLinearGradientNew(start_point: [*c]const ImpellerPoint, end_point: [*c]const ImpellerPoint, stop_count: u32, colors: [*c]const ImpellerColor, stops: [*c]const f32, tile_mode: ImpellerTileMode, transformation: [*c]const ImpellerMatrix) ImpellerColorSource;
pub extern fn ImpellerColorSourceCreateRadialGradientNew(center: [*c]const ImpellerPoint, radius: f32, stop_count: u32, colors: [*c]const ImpellerColor, stops: [*c]const f32, tile_mode: ImpellerTileMode, transformation: [*c]const ImpellerMatrix) ImpellerColorSource;
pub extern fn ImpellerColorSourceCreateConicalGradientNew(start_center: [*c]const ImpellerPoint, start_radius: f32, end_center: [*c]const ImpellerPoint, end_radius: f32, stop_count: u32, colors: [*c]const ImpellerColor, stops: [*c]const f32, tile_mode: ImpellerTileMode, transformation: [*c]const ImpellerMatrix) ImpellerColorSource;
pub extern fn ImpellerColorSourceCreateSweepGradientNew(center: [*c]const ImpellerPoint, start: f32, end: f32, stop_count: u32, colors: [*c]const ImpellerColor, stops: [*c]const f32, tile_mode: ImpellerTileMode, transformation: [*c]const ImpellerMatrix) ImpellerColorSource;
pub extern fn ImpellerColorSourceCreateImageNew(image: ImpellerTexture, horizontal_tile_mode: ImpellerTileMode, vertical_tile_mode: ImpellerTileMode, sampling: ImpellerTextureSampling, transformation: [*c]const ImpellerMatrix) ImpellerColorSource;
pub extern fn ImpellerColorSourceCreateFragmentProgramNew(context: ImpellerContext, fragment_program: ImpellerFragmentProgram, samplers: [*c]ImpellerTexture, samplers_count: usize, data: [*c]const u8, data_bytes_length: usize) ImpellerColorSource;
pub extern fn ImpellerColorFilterRetain(color_filter: ImpellerColorFilter) void;
pub extern fn ImpellerColorFilterRelease(color_filter: ImpellerColorFilter) void;
pub extern fn ImpellerColorFilterCreateBlendNew(color: [*c]const ImpellerColor, blend_mode: ImpellerBlendMode) ImpellerColorFilter;
pub extern fn ImpellerColorFilterCreateColorMatrixNew(color_matrix: [*c]const ImpellerColorMatrix) ImpellerColorFilter;
pub extern fn ImpellerMaskFilterRetain(mask_filter: ImpellerMaskFilter) void;
pub extern fn ImpellerMaskFilterRelease(mask_filter: ImpellerMaskFilter) void;
pub extern fn ImpellerMaskFilterCreateBlurNew(style: ImpellerBlurStyle, sigma: f32) ImpellerMaskFilter;
pub extern fn ImpellerImageFilterRetain(image_filter: ImpellerImageFilter) void;
pub extern fn ImpellerImageFilterRelease(image_filter: ImpellerImageFilter) void;
pub extern fn ImpellerImageFilterCreateBlurNew(x_sigma: f32, y_sigma: f32, tile_mode: ImpellerTileMode) ImpellerImageFilter;
pub extern fn ImpellerImageFilterCreateDilateNew(x_radius: f32, y_radius: f32) ImpellerImageFilter;
pub extern fn ImpellerImageFilterCreateErodeNew(x_radius: f32, y_radius: f32) ImpellerImageFilter;
pub extern fn ImpellerImageFilterCreateMatrixNew(matrix: [*c]const ImpellerMatrix, sampling: ImpellerTextureSampling) ImpellerImageFilter;
pub extern fn ImpellerImageFilterCreateFragmentProgramNew(context: ImpellerContext, fragment_program: ImpellerFragmentProgram, samplers: [*c]ImpellerTexture, samplers_count: usize, data: [*c]const u8, data_bytes_length: usize) ImpellerImageFilter;
pub extern fn ImpellerImageFilterCreateComposeNew(outer: ImpellerImageFilter, inner: ImpellerImageFilter) ImpellerImageFilter;
pub extern fn ImpellerDisplayListRetain(display_list: ImpellerDisplayList) void;
pub extern fn ImpellerDisplayListRelease(display_list: ImpellerDisplayList) void;
pub extern fn ImpellerDisplayListBuilderNew(cull_rect: [*c]const ImpellerRect) ImpellerDisplayListBuilder;
pub extern fn ImpellerDisplayListBuilderRetain(builder: ImpellerDisplayListBuilder) void;
pub extern fn ImpellerDisplayListBuilderRelease(builder: ImpellerDisplayListBuilder) void;
pub extern fn ImpellerDisplayListBuilderCreateDisplayListNew(builder: ImpellerDisplayListBuilder) ImpellerDisplayList;
pub extern fn ImpellerDisplayListBuilderSave(builder: ImpellerDisplayListBuilder) void;
pub extern fn ImpellerDisplayListBuilderSaveLayer(builder: ImpellerDisplayListBuilder, bounds: [*c]const ImpellerRect, paint: ImpellerPaint, backdrop: ImpellerImageFilter) void;
pub extern fn ImpellerDisplayListBuilderRestore(builder: ImpellerDisplayListBuilder) void;
pub extern fn ImpellerDisplayListBuilderScale(builder: ImpellerDisplayListBuilder, x_scale: f32, y_scale: f32) void;
pub extern fn ImpellerDisplayListBuilderRotate(builder: ImpellerDisplayListBuilder, angle_degrees: f32) void;
pub extern fn ImpellerDisplayListBuilderTranslate(builder: ImpellerDisplayListBuilder, x_translation: f32, y_translation: f32) void;
pub extern fn ImpellerDisplayListBuilderTransform(builder: ImpellerDisplayListBuilder, transform: [*c]const ImpellerMatrix) void;
pub extern fn ImpellerDisplayListBuilderSetTransform(builder: ImpellerDisplayListBuilder, transform: [*c]const ImpellerMatrix) void;
pub extern fn ImpellerDisplayListBuilderGetTransform(builder: ImpellerDisplayListBuilder, out_transform: [*c]ImpellerMatrix) void;
pub extern fn ImpellerDisplayListBuilderResetTransform(builder: ImpellerDisplayListBuilder) void;
pub extern fn ImpellerDisplayListBuilderGetSaveCount(builder: ImpellerDisplayListBuilder) u32;
pub extern fn ImpellerDisplayListBuilderRestoreToCount(builder: ImpellerDisplayListBuilder, count: u32) void;
pub extern fn ImpellerDisplayListBuilderClipRect(builder: ImpellerDisplayListBuilder, rect: [*c]const ImpellerRect, op: ImpellerClipOperation) void;
pub extern fn ImpellerDisplayListBuilderClipOval(builder: ImpellerDisplayListBuilder, oval_bounds: [*c]const ImpellerRect, op: ImpellerClipOperation) void;
pub extern fn ImpellerDisplayListBuilderClipRoundedRect(builder: ImpellerDisplayListBuilder, rect: [*c]const ImpellerRect, radii: [*c]const ImpellerRoundingRadii, op: ImpellerClipOperation) void;
pub extern fn ImpellerDisplayListBuilderClipPath(builder: ImpellerDisplayListBuilder, path: ImpellerPath, op: ImpellerClipOperation) void;
pub extern fn ImpellerDisplayListBuilderDrawPaint(builder: ImpellerDisplayListBuilder, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawLine(builder: ImpellerDisplayListBuilder, from: [*c]const ImpellerPoint, to: [*c]const ImpellerPoint, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawDashedLine(builder: ImpellerDisplayListBuilder, from: [*c]const ImpellerPoint, to: [*c]const ImpellerPoint, on_length: f32, off_length: f32, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawRect(builder: ImpellerDisplayListBuilder, rect: [*c]const ImpellerRect, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawOval(builder: ImpellerDisplayListBuilder, oval_bounds: [*c]const ImpellerRect, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawRoundedRect(builder: ImpellerDisplayListBuilder, rect: [*c]const ImpellerRect, radii: [*c]const ImpellerRoundingRadii, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawRoundedRectDifference(builder: ImpellerDisplayListBuilder, outer_rect: [*c]const ImpellerRect, outer_radii: [*c]const ImpellerRoundingRadii, inner_rect: [*c]const ImpellerRect, inner_radii: [*c]const ImpellerRoundingRadii, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawPath(builder: ImpellerDisplayListBuilder, path: ImpellerPath, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawDisplayList(builder: ImpellerDisplayListBuilder, display_list: ImpellerDisplayList, opacity: f32) void;
pub extern fn ImpellerDisplayListBuilderDrawParagraph(builder: ImpellerDisplayListBuilder, paragraph: ImpellerParagraph, point: [*c]const ImpellerPoint) void;
pub extern fn ImpellerDisplayListBuilderDrawShadow(builder: ImpellerDisplayListBuilder, path: ImpellerPath, color: [*c]const ImpellerColor, elevation: f32, occluder_is_transparent: bool, device_pixel_ratio: f32) void;
pub extern fn ImpellerDisplayListBuilderDrawTexture(builder: ImpellerDisplayListBuilder, texture: ImpellerTexture, point: [*c]const ImpellerPoint, sampling: ImpellerTextureSampling, paint: ImpellerPaint) void;
pub extern fn ImpellerDisplayListBuilderDrawTextureRect(builder: ImpellerDisplayListBuilder, texture: ImpellerTexture, src_rect: [*c]const ImpellerRect, dst_rect: [*c]const ImpellerRect, sampling: ImpellerTextureSampling, paint: ImpellerPaint) void;
pub extern fn ImpellerTypographyContextNew(...) ImpellerTypographyContext;
pub extern fn ImpellerTypographyContextRetain(context: ImpellerTypographyContext) void;
pub extern fn ImpellerTypographyContextRelease(context: ImpellerTypographyContext) void;
pub extern fn ImpellerTypographyContextRegisterFont(context: ImpellerTypographyContext, contents: [*c]const ImpellerMapping, contents_on_release_user_data: ?*anyopaque, family_name_alias: [*c]const u8) bool;
pub extern fn ImpellerParagraphStyleNew(...) ImpellerParagraphStyle;
pub extern fn ImpellerParagraphStyleRetain(paragraph_style: ImpellerParagraphStyle) void;
pub extern fn ImpellerParagraphStyleRelease(paragraph_style: ImpellerParagraphStyle) void;
pub extern fn ImpellerParagraphStyleSetForeground(paragraph_style: ImpellerParagraphStyle, paint: ImpellerPaint) void;
pub extern fn ImpellerParagraphStyleSetBackground(paragraph_style: ImpellerParagraphStyle, paint: ImpellerPaint) void;
pub extern fn ImpellerParagraphStyleSetFontWeight(paragraph_style: ImpellerParagraphStyle, weight: ImpellerFontWeight) void;
pub extern fn ImpellerParagraphStyleSetFontStyle(paragraph_style: ImpellerParagraphStyle, style: ImpellerFontStyle) void;
pub extern fn ImpellerParagraphStyleSetFontFamily(paragraph_style: ImpellerParagraphStyle, family_name: [*c]const u8) void;
pub extern fn ImpellerParagraphStyleSetFontSize(paragraph_style: ImpellerParagraphStyle, size: f32) void;
pub extern fn ImpellerParagraphStyleSetHeight(paragraph_style: ImpellerParagraphStyle, height: f32) void;
pub extern fn ImpellerParagraphStyleSetTextAlignment(paragraph_style: ImpellerParagraphStyle, @"align": ImpellerTextAlignment) void;
pub extern fn ImpellerParagraphStyleSetTextDirection(paragraph_style: ImpellerParagraphStyle, direction: ImpellerTextDirection) void;
pub extern fn ImpellerParagraphStyleSetTextDecoration(paragraph_style: ImpellerParagraphStyle, decoration: [*c]const ImpellerTextDecoration) void;
pub extern fn ImpellerParagraphStyleSetMaxLines(paragraph_style: ImpellerParagraphStyle, max_lines: u32) void;
pub extern fn ImpellerParagraphStyleSetLocale(paragraph_style: ImpellerParagraphStyle, locale: [*c]const u8) void;
pub extern fn ImpellerParagraphStyleSetEllipsis(paragraph_style: ImpellerParagraphStyle, ellipsis: [*c]const u8) void;
pub extern fn ImpellerParagraphBuilderNew(context: ImpellerTypographyContext) ImpellerParagraphBuilder;
pub extern fn ImpellerParagraphBuilderRetain(paragraph_builder: ImpellerParagraphBuilder) void;
pub extern fn ImpellerParagraphBuilderRelease(paragraph_builder: ImpellerParagraphBuilder) void;
pub extern fn ImpellerParagraphBuilderPushStyle(paragraph_builder: ImpellerParagraphBuilder, style: ImpellerParagraphStyle) void;
pub extern fn ImpellerParagraphBuilderPopStyle(paragraph_builder: ImpellerParagraphBuilder) void;
pub extern fn ImpellerParagraphBuilderAddText(paragraph_builder: ImpellerParagraphBuilder, data: [*c]const u8, length: u32) void;
pub extern fn ImpellerParagraphBuilderBuildParagraphNew(paragraph_builder: ImpellerParagraphBuilder, width: f32) ImpellerParagraph;
pub extern fn ImpellerParagraphRetain(paragraph: ImpellerParagraph) void;
pub extern fn ImpellerParagraphRelease(paragraph: ImpellerParagraph) void;
pub extern fn ImpellerParagraphGetMaxWidth(paragraph: ImpellerParagraph) f32;
pub extern fn ImpellerParagraphGetHeight(paragraph: ImpellerParagraph) f32;
pub extern fn ImpellerParagraphGetLongestLineWidth(paragraph: ImpellerParagraph) f32;
pub extern fn ImpellerParagraphGetMinIntrinsicWidth(paragraph: ImpellerParagraph) f32;
pub extern fn ImpellerParagraphGetMaxIntrinsicWidth(paragraph: ImpellerParagraph) f32;
pub extern fn ImpellerParagraphGetIdeographicBaseline(paragraph: ImpellerParagraph) f32;
pub extern fn ImpellerParagraphGetAlphabeticBaseline(paragraph: ImpellerParagraph) f32;
pub extern fn ImpellerParagraphGetLineCount(paragraph: ImpellerParagraph) u32;
pub extern fn ImpellerParagraphGetWordBoundary(paragraph: ImpellerParagraph, code_unit_index: usize, out_range: [*c]ImpellerRange) void;
pub extern fn ImpellerParagraphGetLineMetrics(paragraph: ImpellerParagraph) ImpellerLineMetrics;
pub extern fn ImpellerParagraphCreateGlyphInfoAtCodeUnitIndexNew(paragraph: ImpellerParagraph, code_unit_index: usize) ImpellerGlyphInfo;
pub extern fn ImpellerParagraphCreateGlyphInfoAtParagraphCoordinatesNew(paragraph: ImpellerParagraph, x: f64, y: f64) ImpellerGlyphInfo;
pub extern fn ImpellerLineMetricsRetain(line_metrics: ImpellerLineMetrics) void;
pub extern fn ImpellerLineMetricsRelease(line_metrics: ImpellerLineMetrics) void;
pub extern fn ImpellerLineMetricsGetUnscaledAscent(metrics: ImpellerLineMetrics, line: usize) f64;
pub extern fn ImpellerLineMetricsGetAscent(metrics: ImpellerLineMetrics, line: usize) f64;
pub extern fn ImpellerLineMetricsGetDescent(metrics: ImpellerLineMetrics, line: usize) f64;
pub extern fn ImpellerLineMetricsGetBaseline(metrics: ImpellerLineMetrics, line: usize) f64;
pub extern fn ImpellerLineMetricsIsHardbreak(metrics: ImpellerLineMetrics, line: usize) bool;
pub extern fn ImpellerLineMetricsGetWidth(metrics: ImpellerLineMetrics, line: usize) f64;
pub extern fn ImpellerLineMetricsGetHeight(metrics: ImpellerLineMetrics, line: usize) f64;
pub extern fn ImpellerLineMetricsGetLeft(metrics: ImpellerLineMetrics, line: usize) f64;
pub extern fn ImpellerLineMetricsGetCodeUnitStartIndex(metrics: ImpellerLineMetrics, line: usize) usize;
pub extern fn ImpellerLineMetricsGetCodeUnitEndIndex(metrics: ImpellerLineMetrics, line: usize) usize;
pub extern fn ImpellerLineMetricsGetCodeUnitEndIndexExcludingWhitespace(metrics: ImpellerLineMetrics, line: usize) usize;
pub extern fn ImpellerLineMetricsGetCodeUnitEndIndexIncludingNewline(metrics: ImpellerLineMetrics, line: usize) usize;
pub extern fn ImpellerGlyphInfoRetain(glyph_info: ImpellerGlyphInfo) void;
pub extern fn ImpellerGlyphInfoRelease(glyph_info: ImpellerGlyphInfo) void;
pub extern fn ImpellerGlyphInfoGetGraphemeClusterCodeUnitRangeBegin(glyph_info: ImpellerGlyphInfo) usize;
pub extern fn ImpellerGlyphInfoGetGraphemeClusterCodeUnitRangeEnd(glyph_info: ImpellerGlyphInfo) usize;
pub extern fn ImpellerGlyphInfoGetGraphemeClusterBounds(glyph_info: ImpellerGlyphInfo, out_bounds: [*c]ImpellerRect) void;
pub extern fn ImpellerGlyphInfoIsEllipsis(glyph_info: ImpellerGlyphInfo) bool;
pub extern fn ImpellerGlyphInfoGetTextDirection(glyph_info: ImpellerGlyphInfo) ImpellerTextDirection;
