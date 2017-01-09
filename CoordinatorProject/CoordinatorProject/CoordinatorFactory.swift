//
//  CoordinatorFactory.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

struct CoordinatorFactory
{
    func loadViewController<T:CoordinatorProtocol>(coordinator: Coordinators) -> T? {
        
        switch coordinator{
        case .coordinator1(let navigationController):
            return Coordinator1(with: navigationController) as? T
        case .coordinator2(let navigationController):
            return Coordinator2(with: navigationController) as? T
        }
    }
}
