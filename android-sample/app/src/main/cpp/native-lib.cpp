#include <jni.h>
#include <string>
#include "include/jconfig.h"

extern "C" JNIEXPORT jint JNICALL
Java_io_github_porum_libjpegturbo_JpegTurbo_jpegLibVersion(
        JNIEnv *env,
        jobject /* this */) {
    return JPEG_LIB_VERSION;
}