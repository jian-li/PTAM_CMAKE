#PTAM_CMAKE

PTAM_CMAKE is the cmake version of PTAM, tested on ubuntu 14.04.

##Installation
###Libraries Required
```
#Build Tools
sudo apt-get update
sudo apt-get install build-essential

#linear algebra libraries
sudo apt-get install liblapack-dev libblas-dev

#OpenGL
sudo apt-get install freeglut3 freeglut3-dev

#
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libv4l-dev 

sudo apt-get install libgstreamer1.0-dev

#load all the libraries
sudo ldconfig
```
###Compile the libraries
First you should download the sources from github(together with the 3rparty libraries).

```
#Download the source code
git clone https://github.com/jian-li/PTAM_CMAKE
```
- TooN
```
./configure  && sudo make install
```
- libCVD

```
./configure --without-ffmpeg --without-v4l1buffer --without-dc1394v1 --without-dc1394v2
make
sudo make install
```

- GVars3
```
./configure --disable-widgets
make
make install
```

- load the libraries
```
sudo ldconfig
```
	
- Compile the PTAM

```
#go to the root directory of PTAM
mkdir build && cd build
cmake ..
make -j4
```

