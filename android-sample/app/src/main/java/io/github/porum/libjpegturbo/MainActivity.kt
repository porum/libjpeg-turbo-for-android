package io.github.porum.libjpegturbo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import io.github.porum.libjpegturbo.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

  private lateinit var binding: ActivityMainBinding

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    binding = ActivityMainBinding.inflate(layoutInflater)
    setContentView(binding.root)

    val jpegTurbo = JpegTurbo()
    binding.sampleText.text = "jpeg lib version: ${jpegTurbo.jpegLibVersion()}"
  }
}