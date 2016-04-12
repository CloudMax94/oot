# Ocarina of Time
for brevity, all addresses written here are given for the Master Quest Debug version.

# Building
The hacks are written for [lips](https://github.com/notwa/lips/). To run the build file, you must first download lips and place the lips directory it in the same directory as build.lua.

build.lua takes one argument, the path to the asm file that should be disassembled, and will generate a GameShark code, as well as a ROM patch. The ROM patch is saved to patch.txt and can be used with [my ROM Patcher](http://cloudmodding.com/app/rompatcher). The GameShark code is returned through stdout.
