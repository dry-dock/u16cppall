#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 7 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-7 g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-7 50
gcc --version
echo "================== Successfully Installed gcc 7 ==============="

echo "==================== Installing clang 4.0.0 ==================="
wget -nv http://llvm.org/releases/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
tar xf clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
cd clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang 4.0.0 ============"
