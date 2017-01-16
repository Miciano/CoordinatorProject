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
    
    //:Point 1: I believe that this factory should be allowed to
    //:be injected. This way, I can override on tests
    let factory:NodeFactory
    
    public init(with navigationController: UINavigationController)
    {
        self.init(with: navigationController, factory: NodeFactory())
    }
    
    public init(with navigationController: UINavigationController, factory:NodeFactory)
    {
        self.navigationController = navigationController
        self.factory = factory
    }
    //: I applied this concept here, but can be exteded to the other Coordinators
    
    public func start(){
        
        guard var coordinator: Coordinator1 = factory.loadNode(node: .coordinator1(navigationController: navigationController)) else { return }
        coordinator.dismissAction = {
            self.startCoordinator2()
        }
        coordinator.start()
    }
    
    public func startCoordinator2(){
        
        guard var coordinator: Coordinator2 = factory.loadNode(node: .coordinator2(navigationController: navigationController)) else { return }
        coordinator.dismissAction = {
            self.start()
        }
        coordinator.start()
    }
}
