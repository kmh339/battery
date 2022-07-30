import 'package:flutter/services.dart';

mixin Battery {
  static const MethodChannel platform = MethodChannel('batteryPlatform');

  Future<String> getBatteryLevel() async {
    String batteryLevel = 'UNKNOWN';
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    return batteryLevel;
  }
}