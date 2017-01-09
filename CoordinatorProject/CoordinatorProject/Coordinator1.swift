//
//  Coordinator1.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

enum Coordinator1ViewsControllers {
    
    case viewController()
    case greenViewController()
}

public struct Coordinator1: CoordinatorProtocol
{
    var navigationController: UINavigationController
    var factory: Coordinator1ViewControllerFactory = Coordinator1ViewControllerFactory()
    
    init(with navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    public func start() {
        
        guard let controller = factory.loadViewController(controller: .viewController()) as? ViewController else { return }
        
        controller.dismissAction = { _ in
            
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    public func startGreenView() {
        
        guard let controller = factory.loadViewController(controller: .greenViewController()) as? GreenViewController else { return }
        controller.dismissAction = { _ in
        
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
