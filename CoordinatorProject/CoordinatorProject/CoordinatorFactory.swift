//
//  CoordinatorFactory.swift
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

struct CoordinatorFactory
{
    func loadCoordinator<T:CoordinatorProtocol>(coordinator: Coordinators) -> T? {
        
        switch coordinator{
        case .coordinator1(let navigationController):
            return Coordinator1(with: navigationController) as? T
        case .coordinator2(let navigationController):
            return Coordinator2(with: navigationController) as? T
        }
    }
}
