//
//  ViewControllerFactory.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

enum AppScreens {
    case brownViewController()
    case greenViewController()
    case blueViewController()
    case redViewController()
}

struct ViewControllerFactory {
    
    func loadViewController<T:UIViewController>(controller: AppScreens) -> T? {
        
        switch controller{
        case .brownViewController():
            return BrownViewController() as? T
        case .greenViewController():
            return GreenViewController() as? T
        case .blueViewController():
            return BlueViewController() as? T
        case .redViewController():
            return RedViewController() as? T
        }
    }
}
