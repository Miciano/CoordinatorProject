//
//  Coordinator2.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

struct Coordinator2: CoordinatorProtocol, NodeFactoryProtocol
{    
    var navigationController: UINavigationController
    var factory: NodeFactory = NodeFactory()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        
        guard let controller: BlueViewController = factory.loadNode(node: .blueViewController) else { return }
        
        controller.dismissAction = { _ in
            self.startRedView()
        }
        
        navigationController.pushViewController(controller, animated: true)
        
    }
    
    public func startRedView() {
        
        guard let controller: RedViewController = factory.loadNode(node: .redViewController) else { return }
        
        controller.dismissAction = { _ in
            guard let coordinator: Coordinator1 = self.factory.loadNode(node: .coordinator1(navigationController: self.navigationController)) else { return }
            coordinator.start()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
