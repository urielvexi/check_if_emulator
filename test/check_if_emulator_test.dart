import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:check_if_emulator/check_if_emulator.dart';

void main() {
  const MethodChannel channel = MethodChannel('check_if_emulator');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await CheckIfEmulator.platformVersion, '42');
  });
}
