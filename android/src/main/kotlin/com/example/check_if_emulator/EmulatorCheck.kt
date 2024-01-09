package com.example.check_if_emulator

import android.os.Build
import com.scottyab.rootbeer.RootBeer
import android.content.Context
import android.provider.Settings

class EmulatorCheck {
    companion object {
        fun isEmulator() : Boolean = Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || Build.MODEL.startsWith("sdk_")
                || Build.DEVICE.startsWith("emulator")
                || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
                || "google_sdk" == Build.PRODUCT

        fun isJailBroken(context:Context) : Boolean {
            val rootBeer = RootBeer(context)
            return rootBeer.isRooted()
        }

        fun isDevMode(context:Context) : Boolean {
            return when {
                Integer.valueOf(android.os.Build.VERSION.SDK) == 16 -> {
                    Settings.Secure.getInt(context.contentResolver,
                            Settings.Secure.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
                }
                Integer.valueOf(android.os.Build.VERSION.SDK) >= 17 -> {
                    Settings.Secure.getInt(context.contentResolver,
                            Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
                }
                else -> false
            }
        }
    }
}