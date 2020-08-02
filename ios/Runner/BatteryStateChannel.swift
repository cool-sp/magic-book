import Foundation

class BatteryStateChannel: NSObject {
    var sink: FlutterEventSink?

    func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onBatteryStateChanged),
                                               name: UIDevice.batteryStateDidChangeNotification,
                                               object: nil)
    }

    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func onBatteryStateChanged(_: Notification) {
        notifyBatteryState()
    }

    func getBatteryState() -> String {
        let device = UIDevice.current
        return device.batteryState.toString()
    }

    func notifyBatteryState() {
        sink?(getBatteryState())
    }
}

extension BatteryStateChannel: FlutterStreamHandler {
    func onListen(withArguments _: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        sink = events
        notifyBatteryState()
        addObserver()
        return nil
    }

    func onCancel(withArguments _: Any?) -> FlutterError? {
        sink = nil
        removeObserver()
        return nil
    }
}

extension UIDevice.BatteryState {
    func toString() -> String {
        switch self {
        case .unknown:
            return "unknown"
        case .unplugged:
            return "unplugged"
        case .charging:
            return "charging"
        case .full:
            return "full"
        default:
            return "unknown"
        }
    }
}
