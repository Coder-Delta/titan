const std = @import("std");
const client = @import("engine/connection.zig");

pub fn main() !void {
    const result = client.eclient();
    _ = try result;
}