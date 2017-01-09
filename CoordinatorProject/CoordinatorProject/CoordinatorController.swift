//
//  CoordinatorController.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

public struct CoordinatorController: CoordinatorProtocol
{
    var navigationController: UINavigationController
    var factory:CoordinatorFactory = CoordinatorFactory()
    
    public init(with navigationController: UINavigationController)
    {
        self.navigationController = navigationController
    }
    
    public func start(){
        
        guard var coordinator: Coordinator1 = factory.loadCoordinator(coordinator: .coordinator1(navigationController: navigationController)) else { return }
        coordinator.dismissAction = {
            self.startCoordinator2()
        }
        coordinator.start()
    }
    
    public func startCoordinator2(){
        
        guard var coordinator: Coordinator2 = factory.loadCoordinator(coordinator: .coordinator2(navigationController: navigationController)) else { return }
        coordinator.dismissAction = {
            self.start()
        }
        coordinator.start()
    }
}
