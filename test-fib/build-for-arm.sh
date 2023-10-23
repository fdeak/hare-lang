#! /bin/sh

# for cross compiling you need a properly build hare toolchain see build-from-scratch.sh

hare build -a aarch64 -o m-aarch64 main.ha

