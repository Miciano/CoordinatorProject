//
//  Coordinator2ViewControllerFactory.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit
struct Coordinator2ViewControllerFactory
{
    func loadViewController<T:UIViewController>(controller: Coordinator2ViewsControllers) -> T? {
        
        switch controller{
        case .blueViewController():
            return RedViewController() as? T
        case .redViewController():
            return BlueViewController() as? T
        }
    }
}
