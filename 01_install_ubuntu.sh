sudo apt-get update && \
sudo apt-get install build-essential software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update && sudo apt-get dist-upgrade && \
sudo apt-get install gcc-snapshot -y && \
sudo apt-get update && \
sudo apt-get install gcc-6 g++-6 gfortran-6 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6 --slave /usr/bin/gfortran gfortran /usr/bin/gfortran-6

sudo apt-get install autotools-dev autoconf automake cmake cmake-curses-gui -y

sudo apt-get install git bash-completion
 

