use fmt;
use net::udp;
use net::ip;
use strings;

fn fib(n: int) int = {
    if (n < 2) {
        return 1;
    } else {
        return fib(n - 2) + fib(n - 1);
    };
};

export fn main() void = {
    let n = 40;
    fmt::printfln("{}:{}", n, fib(n))!;
};

