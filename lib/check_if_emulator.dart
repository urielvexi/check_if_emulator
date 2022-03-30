
import 'dart:async';

import 'package:flutter/services.dart';

class CheckIfEmulator {
  static const MethodChannel _channel = MethodChannel('check_if_emulator');

  /// Comprueba si el dispositivo es real o emulado
  static Future<bool> get isRealDevice async {
    final bool isRealDevice = await _channel.invokeMethod('isRealDevice');
    return isRealDevice;
  }

  /// Comprueba si el dispositivo tiene Jailbrek iOS/Android
  static Future<bool> get isJailBroken async {
    final bool isJailBroken = await _channel.invokeMethod('isJailBroken');
    return isJailBroken;
  }

  /// Comprueba si el dispositivo esta en modo desarrollador
  static Future<bool> get isDeveloperMode async {
    final bool isJailBroken = await _channel.invokeMethod('developerMode');
    return isJailBroken;
  }
}
