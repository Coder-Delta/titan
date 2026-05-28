const std = @import("std");

pub const BufferPool = struct {
    allocator: std.mem.Allocator,
    pool: std.ArrayListUnmanaged([]u8),
    buffer_size: usize,

    pub fn init(allocator: std.mem.Allocator, buffer_size: usize) BufferPool {
        return .{
            .allocator = allocator,
            .pool = std.ArrayListUnmanaged([]u8).empty,
            .buffer_size = buffer_size,
        };
    }

    pub fn acquire(self: *BufferPool) ![]u8 {
        if (self.pool.items.len > 0) {
            return self.pool.pop();
        }
        return self.allocator.alloc(u8, self.buffer_size);
    }

    pub fn release(self: *BufferPool, buf: []u8) !void {
        try self.pool.append(self.allocator, buf);
    }

    pub fn deinit(self: *BufferPool) void {
        for (self.pool.items) |buf| {
            self.allocator.free(buf);
        }
        self.pool.deinit(self.allocator);
    }
};
