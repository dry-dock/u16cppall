#!/bin/bash -e

echo "==================== Testing gcc ================"


g++ helloworld.cpp
./a.out

echo "==================== Tested successfully ==========="

echo "==================== Testing clang ================"
clang helloworld.c
./a.out

echo "==================== Tested successfully ==========="



