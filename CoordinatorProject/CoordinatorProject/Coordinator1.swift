//
//  Coordinator1.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

public struct Coordinator1: CoordinatorProtocol, NodeFactoryProtocol, Dismissable
{
    var navigationController: UINavigationController
    var factory: NodeFactory = NodeFactory()
    var dismissAction: DismissCoordinator = {}
    
    init(with navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    public func start() {
        
        guard let controller: BrownViewController = factory.loadNode(node: .brownViewController) else { return }
        
        controller.dismissAction = { _ in
            self.startGreenView()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    public func startGreenView() {
        
        guard let controller: GreenViewController = factory.loadNode(node: .greenViewController) else { return }
        controller.dismissAction = { _ in
            self.callDismiss()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
