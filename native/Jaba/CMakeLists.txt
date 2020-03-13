cmake_minimum_required(VERSION 3.1)

project(JiviX CXX)

# We are only interested in finding jni.h: we do not care about extended JVM
# functionality or the AWT library.
#set(JAVA_AWT_LIBRARY "")
#set(JAVA_JVM_LIBRARY "")
#set(JAVA_INCLUDE_PATH2 "")
#set(JAVA_AWT_INCLUDE_PATH "")
find_package(JNI REQUIRED)
include(UseJava)

find_package(Java REQUIRED)
find_package(Vulkan REQUIRED)


set(DCMAKE_SH="CMAKE_SH-NOTFOUND")
if(MINGW)
    set(CMAKE_SHARED_LIBRARY_PREFIX "")
    set(CMAKE_STATIC_LIBRARY_PREFIX "")
    set(GNUtoMS TRUE)
endif()

set (DEFINES
    #-DTARGET_OS_IPHONE # Очередное DеRьMшище
)

# Compiler specific options
if (MSVC) # Clang in Visual Studio 2017
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  /diagnostics:caret /std:c++latest /arch:AVX2 /tune:skylake /fp:strict /permissive- /Qspectre /JMC /Oy /Oi /Ot /Ox /GT /GL /Gy /Qpar /W3 /NODEFAULTLIB:library") # Native compiler of Visual Studio 2017
    set (CMAKE_DOTNET_TARGET_FRAMEWORK_VERSION "v4.7.2")
else()
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Og -Wa,-mbig-obj -m64 -std=c++2a -march=skylake -mtune=skylake -fpermissive -w -Ofast --combine -fwhole-program")
    set (CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -g -Og -Wa,-mbig-obj -m64 -std=c1x   -march=skylake -mtune=skylake -fpermissive -w -Ofast --combine -fwhole-program")
    #if (WIN32)
    #    set (CMAKE_CXX_FLAGS "${CMAK_CXX_FLAGS} -Wa,-mbig-obj")
    #    set (CMAKE_C_FLAGS "${CMAK_C_FLAGS} -Wa,-mbig-obj")
    #endif()
endif()

set (jniJabaClass "")
link_directories(${PROJECT_SOURCE_DIR} "./")
include_directories(${JNI_INCLUDE_DIRS} ${Vulkan_INCLUDE_DIR} ${PROJECT_SOURCE_DIR} "./")
add_definitions(${DEFINES})
add_library(jniJabaClass SHARED VKWrap/jnijavacpp.cpp VKWrap/jniJabaClass.h VKWrap/jniJabaClass.cpp)
target_link_libraries(jniJabaClass PUBLIC -lpsapi "${JNI_LIBRARIES}")

set (jniVkDeviceCreateInfoWrap "")
add_definitions(${DEFINES})
add_library(jniVkDeviceCreateInfoWrap SHARED VKWrap/jnijavacpp.cpp VKWrap/jniVkDeviceCreateInfoWrap.h VKWrap/jniVkDeviceCreateInfoWrap.cpp)
target_link_libraries(jniVkDeviceCreateInfoWrap PUBLIC -lpsapi "${JNI_LIBRARIES}")
