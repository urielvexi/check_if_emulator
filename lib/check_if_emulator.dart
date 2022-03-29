
import 'dart:async';

import 'package:flutter/services.dart';

class CheckIfEmulator {
  static const MethodChannel _channel = MethodChannel('check_if_emulator');

  /// Comprueba si el dispositivo es real o emulado
  static Future<bool> get isRealDevice async {
    final bool isRealDevice = await _channel.invokeMethod('isRealDevice');
    return isRealDevice;
  }
}
