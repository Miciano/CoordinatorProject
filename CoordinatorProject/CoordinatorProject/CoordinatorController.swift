//
//  CoordinatorController.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

enum Coordinators
{
    case coordinator1(navigationController: UINavigationController)
    case coordinator2(navigationController: UINavigationController)
}

public struct CoordinatorController: CoordinatorProtocol
{
    var navigationController: UINavigationController
    var factory:CoordinatorFactory = CoordinatorFactory()
    
    public init(with navigationController: UINavigationController)
    {
        self.navigationController = navigationController
    }
    
    public func start(){
        
        guard let coordinator = factory.loadViewController(coordinator: .coordinator1(navigationController: navigationController)) as? Coordinator1 else { return }
    }
    
    public func startCoordinator2(){
        
    }
}
