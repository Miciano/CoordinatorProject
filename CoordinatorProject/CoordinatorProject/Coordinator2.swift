//
//  Coordinator2.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

enum Coordinator2ViewsControllers {
    
    case blueViewController()
    case redViewController()
}

struct Coordinator2: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    var factory: Coordinator2ViewControllerFactory = Coordinator2ViewControllerFactory()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        
        guard let controller = factory.loadViewController(controller: .blueViewController()) as? BlueViewController else { return }
        
        controller.dismissAction = { _ in
            
        }
        
        navigationController.pushViewController(controller, animated: true)
        
    }
    
    public func startBlueView() {
        
        guard let controller = factory.loadViewController(controller: .redViewController()) as? RedViewController else { return }
        
        controller.dismissAction = { _ in
            
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
