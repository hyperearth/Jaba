cmake_minimum_required(VERSION 3.1)

project(JiviX CXX)
find_package(Java REQUIRED)
find_package(JNI REQUIRED)
find_package(Vulkan REQUIRED)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m64 -std=c++2a -march=skylake -mtune=skylake -fpermissive -w -Ofast")
set (CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -m64 -std=c1x   -march=skylake -mtune=skylake -fpermissive -w -Ofast")

if(MINGW)
    set(CMAKE_SHARED_LIBRARY_PREFIX "")
    set(CMAKE_STATIC_LIBRARY_PREFIX "")
    set(GNUtoMS TRUE)
endif()

link_directories(${PROJECT_SOURCE_DIR} "./")
include_directories(${JNI_INCLUDE_DIRS} ${Vulkan_INCLUDE_DIR} ${PROJECT_SOURCE_DIR} "./")
add_library(jniJabaClass SHARED jnijavacpp.cpp jniJabaClass.cpp)
target_link_libraries(jniJabaClass PUBLIC -lpsapi ${JNI_LIBRARIES} ${JAVA_JVM_LIBRARY})

add_library(jniVkDeviceCreateInfoWrap SHARED jnijavacpp.cpp jniVkDeviceCreateInfoWrap.cpp)
target_link_libraries(jniVkDeviceCreateInfoWrap PUBLIC -lpsapi ${JNI_LIBRARIES})
