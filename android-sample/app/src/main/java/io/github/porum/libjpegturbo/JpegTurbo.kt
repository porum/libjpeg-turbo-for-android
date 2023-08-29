package io.github.porum.libjpegturbo

class JpegTurbo {

  external fun jpegLibVersion(): Int

  companion object {
    init {
      try {
        System.loadLibrary("sample")
      } catch (e: UnsatisfiedLinkError) {
        e.printStackTrace()
      }
    }
  }
}