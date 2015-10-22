#lijian 2015/10/22
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

#set the project name
PROJECT(PTAM)

#set the cmake_module_path
SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/MODULES")

#add the 3rdparty libraries
FIND_PACKAGE(GLIB2 REQUIRED)
FIND_PACKAGE(GSTREAMER REQUIRED)
FIND_PACKAGE(TOON REQUIRED)
FIND_PACKAGE(GVars3 REQUIRED)
FIND_PACKAGE(OpenCV REQUIRED)
FIND_PACKAGE(CVD REQUIRED)
FIND_PACKAGE(OpenGL REQUIRED)

MESSAGE("----------------------------------")
IF(GLIB2_FOUND)
	MESSAGE(STATUS "GLIB2 found!")
ENDIF(GLIB2_FOUND)
IF(GSTREAMER_0_10_FOUND)
	MESSAGE(STATUS "GSTREAMER found!")
ELSE()
	MESSAGE(STATUS "GStreamer not found!")
ENDIF()
IF(GVars3_FOUND)
	MESSAGE(STATUS "GVars3 Found!")
ENDIF(GVars3_FOUND)
IF(TOON_FOUND)
	MESSAGE(STATUS "Toon FOUND!")
ENDIF(TOON_FOUND)
IF(CVD_FOUND)
	MESSAGE(STATUS "CVD FOUND!")
ENDIF(CVD_FOUND)
IF(OpenGL_FOUND)
	MESSAGE(STATUS "OpenGL found!")
ENDIF(OpenGL_FOUND)
MESSAGE("----------------------------------")


#set the include directory
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/include 
		    ${GLIB2_INCLUDE_DIRS}
		    ${GVars3_INCLUDE_DIR}
		    ${CVD_INCLUDE_DIR}
		    ${OPENGL_INCLUDE_DIR}
            ${GSTREAMER_INCLUDE_DIR})

#		    ${OPENGL_INCLUDE_DIRS}
# 		    ${GLUT_INCLUDE_DIR})

#add the src files
SET(PTAM_SRC_LIST
	src/main.cc
	src/GLWindow2.cc
	src/GLWindowMenu.cc
	src/VideoSource_Linux_DV.cc
	src/System.cc
	src/ATANCamera.cc
	src/KeyFrame.cc
	src/MapPoint.cc
	src/Map.cc
	src/SmallBlurryImage.cc
	src/ShiTomasi.cc
	src/HomographyInit.cc
	src/MapMaker.cc
	src/Bundle.cc
	src/PatchFinder.cc
	src/Relocaliser.cc
	src/MiniPatch.cc
	src/MapViewer.cc
	src/ARDriver.cc
	src/EyeGame.cc
	src/Tracker.cc
)

SET(Calibrator_SRC_LIST
	src/GLWindow2.cc
    src/GLWindowMenu.cc
    src/VideoSource_Linux_DV.cc
    src/CalibImage.cc
    src/CalibCornerPatch.cc
    src/ATANCamera.cc
    src/CameraCalibrator.cc
)

#generate the executable files
ADD_EXECUTABLE(PTAM ${PTAM_SRC_LIST})
ADD_EXECUTABLE(Calibrator ${Calibrator_SRC_LIST})

TARGET_LINK_LIBRARIES(PTAM  
		      ${GLIB2_LIBRARIES}
			  ${GSTREAMER_LIBRARIES}
			  ${GVars3_LIBRARIES}
			  ${OpenCV_LIBRARIES}
			  ${CVD_LIBRARY}
			  ${OPENGL_LIBRARIES})


TARGET_LINK_LIBRARIES(Calibrator
		      ${GLIB2_LIBRARIES}
			  ${GSTREAMER_LIBRARIES}
			  ${GVars3_LIBRARIES}
			  ${OpenCV_LIBRARIES}
			  ${CVD_LIBRARY}
			  ${OPENGL_LIBRARIES})




