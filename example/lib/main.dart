import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:check_if_emulator/check_if_emulator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isPlatformRealDevice = true;
  String _esDeveloper = "nada";
  String _esRoot = "nada";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await CheckIfEmulator.isRealDevice;
      _esDeveloper = "${await CheckIfEmulator.isDeveloperMode}";
      _esRoot = "${await CheckIfEmulator.isJailBroken}";
    } on PlatformException {
      print("Oh no, un error");
      platformVersion = true;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isPlatformRealDevice = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Running on real device: $_isPlatformRealDevice\n'),
              Text('Running on dev mode: $_esDeveloper\n'),
              Text('Running on root device: $_esRoot\n'),
            ],
          ),
        ),
      ),
    );
  }
}
