#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 7.2 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y \
  gcc-7=7.2.0-1ubuntu1~16.04 \
  g++-7=7.2.0-1ubuntu1~16.04
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-7 50
gcc --version
echo "================== Successfully Installed gcc 7.2 ==============="

apt-get install autoconf=2.69* automake=1:1.15* ccache=3.2.4* libssl-dev=1.0.2g*

CLANG_VERSION=5.0.1
echo "==================== Installing clang $CLANG_VERSION ==================="

wget -nv http://releases.llvm.org/"$CLANG_VERSION"/clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-16.04.tar.xz
tar xf clang+llvm-"$CLANG_VERSION"-linux-x86_64-ubuntu16.04.tar.xz
cd clang+llvm-"$CLANG_VERSION"-linux-x86_64-ubuntu16.04
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang $CLANG_VERSION ============"
