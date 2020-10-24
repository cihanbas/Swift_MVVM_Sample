
import Foundation
import UIKit
protocol StartFlow{
    func dismiss()
}

class DashboardCoordinator: Coordinator, StartFlow {
    let navigation: UINavigationController
    func start() {
        let dashboardVC = NewsVC()
        navigation.pushViewController(dashboardVC, animated: true)
    }
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    func dismiss() {
        print("Dismiss")
    }
    
    
}
