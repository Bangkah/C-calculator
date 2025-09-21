
import std.stdio;
import std.conv;

void main() {
    writeln("Masukkan angka pertama: ");
    double a = to!double(readln());

    writeln("Masukkan angka kedua: ");
    double b = to!double(readln());

    writeln("Pilih operasi (+, -, *, /): ");
    string op = readln().strip;

    double result;

    final switch(op) {
        case "+": result = a + b; break;
        case "-": result = a - b; break;
        case "*": result = a * b; break;
        case "/": 
            if (b == 0) {
                writeln("Error: pembagian dengan nol");
                return;
            }
            result = a / b; 
            break;
        default:
            writeln("Operasi tidak valid.");
            return;
    }

    writeln("Hasil: ", result);
}
