#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 8.0.1 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y \
  gcc-8=8* \
  g++-8=8*
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-8 80
gcc --version
echo "================== Successfully Installed gcc 8.0.1 ==============="

apt-get install \
  autoconf=2.69* \
  automake=1:1.15* \
  ccache=3.2* \
  libssl-dev=1.0*

CLANG_VERSION=6.0.0
echo "==================== Installing clang $CLANG_VERSION ==================="

wget -nv http://releases.llvm.org/"$CLANG_VERSION"/clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-16.04.tar.xz
tar xf clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-16.04.tar.xz
cd clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-16.04
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang $CLANG_VERSION ============"
