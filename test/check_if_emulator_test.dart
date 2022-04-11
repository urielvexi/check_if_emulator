import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:check_if_emulator/check_if_emulator.dart';

void main() {
  const MethodChannel channel = MethodChannel('check_if_emulator');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return false;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isRealDevice', () async {
    expect(await CheckIfEmulator.isRealDevice, false);
  });
}
