const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const impeller_dep = b.dependency("impeller", .{});
    const impeller_obj = impeller_dep.path("lib/libimpeller.a");

    const glfw_dep = b.dependency("glfw.zig", .{ .target = target, .optimize = optimize });
    const glfw_lib = glfw_dep.artifact("glfw");

    const exe = b.addExecutable(.{
        .name = "almond",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{},
        }),
    });

    exe.root_module.linkFramework("Foundation", .{});
    exe.root_module.linkFramework("CoreGraphics", .{});
    exe.root_module.linkFramework("AppKit", .{});
    exe.root_module.linkFramework("Metal", .{});
    exe.root_module.linkFramework("MetalKit", .{});
    exe.root_module.linkFramework("MetalPerformanceShaders", .{});

    exe.root_module.linkLibrary(glfw_lib);
    exe.root_module.addObjectFile(impeller_obj);

    b.installArtifact(exe);

    const run_step = b.step("run", "Run the app");

    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);

    run_cmd.step.dependOn(b.getInstallStep());

    run_cmd.addPassthruArgs();

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });

    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_exe_tests.step);
}
