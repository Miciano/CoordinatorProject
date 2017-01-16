//
//  Coordinator2.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

struct Coordinator2: CoordinatorProtocol, NodeFactoryProtocol, Dismissable
{    
    var navigationController: UINavigationController
    var factory: NodeFactory = NodeFactory()
    var dismissAction: DismissCoordinator = {}
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        
        guard let controller: BlueViewController = factory.loadNode(node: .blueViewController) else { return }
        
        controller.dismissAction = { _ in
            self.startBlueView()
        }
        
        navigationController.pushViewController(controller, animated: true)
        
    }
    
    public func startBlueView() {
        
        guard let controller: RedViewController = factory.loadNode(node: .redViewController) else { return }
        
        controller.dismissAction = { _ in
            self.callDismiss()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
