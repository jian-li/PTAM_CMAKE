#PTAM_CMAKE

PTAM_CMAKE is the cmake version of PTAM, tested on ubuntu 14.04.

##Installation
###Libraries Required
```
#Build Tools
sudo apt-get update
sudo apt-get install build-essential cmake pkg-config

#Boost for C++
sudo apt-get install libboost-dev libboost-doc

#linear algebra libraries
sudo apt-get install liblapack-dev libblas-dev

#Vedio IO
sudo apt-get install libavcodec-dev libavformat-dev libavutil-dev libpostproc-dev libswscale-dev libavdevice-dev libsdl-dev
sudo apt-get install libgtk2.0-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev 

#OpenGL
sudo apt-get install mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev

#OpenCV
cd OPENCV_PATH
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.6.1/opencv-2.4.6.1.tar.gz
tar zxvf opencv-2.4.6.1.tar.gz
cd opencv-2.4.6.1/
mkdir release 
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make
sudo make install

#load all the libraries
sudo ldconfig
```
###Compile the libraries
First you should download the sources from github(together with the 3rparty libraries).

```
#Download the source code
git clone https://github.com/jian-li/PTAM_CMAKE

#TooN
./configure && make && sudo make install

#libCVD
./configure --without-ffmpeg --without-v4l1buffer --without-dc1394v1 --without-dc1394v2
make
sudo make install

#GVars3
./configure --disable-widgets
make
make install

#load the libraries
sudo ldconfig

```	
Compile the PTAM

```
#go to the root directory of PTAM
mkdir build && cd build
cmake ..
make -j4
```

