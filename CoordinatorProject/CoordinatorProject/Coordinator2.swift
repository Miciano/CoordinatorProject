//
//  Coordinator2.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

struct Coordinator2: CoordinatorProtocol, CoordinatorFactoryProtocol, Dismissable
{    
    var navigationController: UINavigationController
    var factory: ViewControllerFactory = ViewControllerFactory()
    var dismissAction: DismissCoordinator = {}
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        
        guard let controller: BlueViewController = factory.loadViewController(controller: .blueViewController) else { return }
        
        controller.dismissAction = { _ in
            self.startBlueView()
        }
        
        navigationController.pushViewController(controller, animated: true)
        
    }
    
    public func startBlueView() {
        
        guard let controller: RedViewController = factory.loadViewController(controller: .redViewController) else { return }
        
        controller.dismissAction = { _ in
            self.callDismiss()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
