cmake_minimum_required(VERSION 3.22.1)

project("sample")

set(ANDROID_ABI arm64-v8a)
set(CMAKE_BUILD_TYPE "Release")

add_library(turbojpeg SHARED IMPORTED)
set_target_properties(turbojpeg PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/libturbojpeg.so)
add_library(jpeg SHARED IMPORTED)
set_target_properties(jpeg PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/libjpeg.so)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

add_library(sample SHARED native-lib.cpp)

target_link_libraries(sample jpeg turbojpeg jnigraphics log)