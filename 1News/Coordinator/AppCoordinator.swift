import Foundation

import Foundation
import UIKit
class AppCoordinator: Coordinator {
    let window : UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let navigation  = UINavigationController()
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        let todosCoordinator = DashboardCoordinator(navigation :navigation )
        coordinate(to: todosCoordinator)
    }
}
