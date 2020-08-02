import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    registerCustomizedPlugin(name: "BatteryPlugin", cls: BatteryPlugin.self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

extension AppDelegate {
  func registerCustomizedPlugin(name: String, cls: FlutterPlugin.Type) {
    cls.register(with: registrar(forPlugin: name))
  }
}
