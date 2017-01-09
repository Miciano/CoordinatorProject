//
//  Coordinator1ViewControllerFactory.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

struct Coordinator1ViewControllerFactory
{
    func loadViewController<T:UIViewController>(controller: Coordinator1ViewsControllers) -> T? {
        
        switch controller{
        case .viewController():
            return ViewController() as? T
        case .greenViewController():
            return GreenViewController() as? T
        }
    }
}
