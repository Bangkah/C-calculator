const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    try stdout.print("Masukkan angka pertama: ", .{});
    var buffer1: [100]u8 = undefined;
    const line1 = try stdin.readUntilDelimiterOrEof(&buffer1, '\n');
    const a = try std.fmt.parseFloat(f64, line1.?);

    try stdout.print("Masukkan angka kedua: ", .{});
    var buffer2: [100]u8 = undefined;
    const line2 = try stdin.readUntilDelimiterOrEof(&buffer2, '\n');
    const b = try std.fmt.parseFloat(f64, line2.?);

    try stdout.print("Hasil: {}\n", .{a + b});
}
