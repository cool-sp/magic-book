import 'package:flutter/services.dart';

enum BatteryState {
  unknown,
  unplugged,
  charging,
  full,
}

class Battery {
  static Battery _instance;

  final MethodChannel _methodChannel;
  final EventChannel _stateChannel;
  final EventChannel _levelChannel;

  Stream<BatteryState> _batteryStateStream;
  Stream<int> _batteryLevelStream;

  factory Battery() {
    if (_instance == null) {
      final MethodChannel methodChannel = MethodChannel('io.battery/method');
      final EventChannel stateChannel = EventChannel('io.battery/state');
      final EventChannel levelChannel = EventChannel('io.battery/level');
      _instance = Battery.private(methodChannel, stateChannel, levelChannel);
    }
    return _instance;
  }

  Battery.private(this._methodChannel, this._stateChannel, this._levelChannel);

  Future<BatteryState> get batteryState {
    return _methodChannel
        .invokeMethod<String>('getBatteryState')
        .then<BatteryState>((String state) => _parseStateString(state));
  }

  Future<int> get batteryLevel {
    return _methodChannel.invokeMethod<int>('getBatteryLevel');
  }

  Stream<BatteryState> get batteryStateStream {
    if (_batteryStateStream == null) {
      _batteryStateStream = _stateChannel
          .receiveBroadcastStream()
          .map((event) => _parseStateString(event));
    }
    return _batteryStateStream;
  }

  Stream<int> get batteryLevelStream {
    if (_batteryLevelStream == null) {
      _batteryLevelStream =
          _levelChannel.receiveBroadcastStream().map((event) => event as int);
    }
    return _batteryLevelStream;
  }

  BatteryState _parseStateString(String state) {
    switch (state) {
      case 'unknown':
        return BatteryState.unknown;
      case 'unplugged':
        return BatteryState.unplugged;
      case 'charging':
        return BatteryState.charging;
      case 'full':
        return BatteryState.full;
    }

    return BatteryState.unknown;
  }
}
