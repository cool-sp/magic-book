import Foundation

class BatteryLevelChannel: NSObject {
    var sink: FlutterEventSink?

    func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onBatteryLevelChanged),
                                               name: UIDevice.batteryLevelDidChangeNotification,
                                               object: nil)
    }

    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func onBatteryLevelChanged(_: Notification) {
        notifyBatteryLevel()
    }

    func getBatteryLevel() -> Int {
        let device = UIDevice.current
        if device.batteryState == UIDevice.BatteryState.unknown {
            return -1
        }
        return Int(device.batteryLevel * 100)
    }

    func notifyBatteryLevel() {
        sink?(getBatteryLevel())
    }
}

extension BatteryLevelChannel: FlutterStreamHandler {
    func onListen(withArguments _: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        sink = events
        notifyBatteryLevel()
        addObserver()
        return nil
    }

    func onCancel(withArguments _: Any?) -> FlutterError? {
        sink = nil
        removeObserver()
        return nil
    }
}
