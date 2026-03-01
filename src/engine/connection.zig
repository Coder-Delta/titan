const std = @import("std");
const net = std.net;

const addr = net.Address.initIp4(.{ 127, 0, 0, 1 }, 7496);

pub fn eclient() !void {
    const options = net.StreamServer.Options{};
    var server = net.StreamServer.init(options);
    // Listening
    _ = try server.listen(addr);

    std.debug.print("Server is listening on: {any}\n", .{addr});
    while (true) {
        const client = try server.accept();
        const client_addr = client.address;
        const stream = client.stream;

        // Buffer for read
        var buffer: [256]u8 = undefined;

        _ = try stream.read(&buffer);
        _ = try stream.write("Hi there!");

        std.debug.print("client addr is : {any}\n", .{client_addr});
        std.debug.print("request buffer is : {s}\n", .{buffer});
    }
}