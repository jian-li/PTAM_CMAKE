# Find installed GVars3
#variables
#GVars3_INCLUDE_DIR

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/MODULES")
# GVars3 requires TooN
find_package(TOON REQUIRED)

# find include path
find_path(GVars3_INCLUDE_DIR
   NAMES gvars3/gvars3.h
   DOC "GVars3 include path"
)

# find static library
find_library(GVars3_LIBRARY
   NAMES GVars3
   DOC "GVars3 library path"
)

set(GVars3_INCLUDE_DIRS ${GVars3_INCLUDE_DIR} ${TOON_INCLUDE_DIRS})
set(GVars3_LIBRARIES ${GVars3_LIBRARY} ${TOON_LIBRARIES})

if (TOON_FOUND AND GVars3_INCLUDE_DIR AND GVars3_LIBRARY)
   set(GVars3_FOUND TRUE)
   if (NOT GVars3_FIND_QUIETLY)
      message (STATUS "Found GVars3: ${GVars3_LIBRARY}")
   endif()
else()
   set(GVars3_FOUND FALSE)
   if (GVars3_FIND_REQUIRED)
      if (NOT TOON_FOUND)
         message(FATAL_ERROR "Could not find TooN (required by GVars3)")
      else()
         message(FATAL_ERROR "Could not find GVars3")
      endif()
   endif()
endif()
