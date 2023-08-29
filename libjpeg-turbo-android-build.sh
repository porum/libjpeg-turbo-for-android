NDK_PATH=/Users/sunguobao/Library/Android/android-ndk-r20b
TOOLCHAIN=clang
ANDROID_VERSION=23 # https://developer.android.com/ndk/guides/cmake?hl=zh-cn#android_arm_neon
SOURCE_DIRECTORY=../../libjpeg-turbo
BUILD_DIRECTORY=./build

if [ ! -d "$BUILD_DIRECTORY" ]; then
  mkdir $BUILD_DIRECTORY
fi
cd $BUILD_DIRECTORY

build() {
  ANDROID_ABI=$1

  if [ ! -d "$ANDROID_ABI" ]; then
    mkdir $ANDROID_ABI
  fi
  cd $ANDROID_ABI

  cmake -G"Unix Makefiles" \
    -DANDROID_ABI=${ANDROID_ABI} \
    -DANDROID_ARM_MODE=arm \
    -DANDROID_PLATFORM=android-${ANDROID_VERSION} \
    -DANDROID_TOOLCHAIN=${TOOLCHAIN} \
    -DCMAKE_ASM_FLAGS="--target=aarch64-linux-android${ANDROID_VERSION}" \
    -DCMAKE_TOOLCHAIN_FILE=${NDK_PATH}/build/cmake/android.toolchain.cmake \
    -DCMAKE_INSTALL_PREFIX=$(pwd)/dist \
    ${SOURCE_DIRECTORY}
  make clean
  make
  make install

  cd ..
}

build armeabi-v7a
build arm64-v8a
