import Foundation

class BatteryPlugin: NSObject, FlutterPlugin {
    static let instance = BatteryPlugin()

    let batteryStateChannel = BatteryStateChannel()
    let batteryLevelChannel = BatteryLevelChannel()

    static func register(with registrar: FlutterPluginRegistrar) {
        enableBatteryMonitoring()

        let methodChannel = FlutterMethodChannel(name: "io.battery/method", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: methodChannel)

        let stateEventChannel = FlutterEventChannel(name: "io.battery/state", binaryMessenger: registrar.messenger())
        stateEventChannel.setStreamHandler(instance.batteryStateChannel)

        let levelEventChannel = FlutterEventChannel(name: "io.battery/level", binaryMessenger: registrar.messenger())
        levelEventChannel.setStreamHandler(instance.batteryLevelChannel)
    }

    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getBatteryState" {
            let state = batteryStateChannel.getBatteryState()
            result(state)
        } else if call.method == "getBatteryLevel" {
            let level = batteryLevelChannel.getBatteryLevel()
            result(level)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private static func enableBatteryMonitoring() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
}
