import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?

    lazy var fetcher: Fetcher = {
        let fetcher = Fetcher(baseURL: "https://server.com", modelName: "DataModel")

        return fetcher
    }()
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { fatalError("Window not found") }

        window.rootViewController = RootController(fetcher: self.fetcher)
        window.makeKeyAndVisible()

        return true
    }
}
