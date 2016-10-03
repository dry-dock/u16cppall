#!/bin/bash -e

echo "========================= Clean apt-get ========================"
sudo apt-get clean
sudo mv /var/lib/apt/lists/* /tmp
sudo mkdir -p /var/lib/apt/lists/partial
sudo apt-get clean
sudo apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 5 ======================"
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
gcc --version
echo "================== Successfully Installed gcc 5 ==============="

echo "==================== Installing clang 3.9.0 ==================="
sudo wget http://llvm.org/releases/3.9.0/clang+llvm-3.9.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
tar xf clang+llvm-3.9.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
cd clang+llvm-3.9.0-x86_64-linux-gnu-ubuntu-16.04
sudo cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang 3.9.0 ============"
