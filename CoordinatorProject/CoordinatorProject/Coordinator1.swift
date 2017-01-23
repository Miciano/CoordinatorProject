//
//  Coordinator1.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

public struct Coordinator1: CoordinatorProtocol, NodeFactoryProtocol
{
    var navigationController: UINavigationController
    var factory: NodeFactory = NodeFactory()
    
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
            guard let coordinator: Coordinator2 = self.factory.loadNode(node: .coordinator2(navigationController: self.navigationController)) else { return }
            coordinator.start()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
