//
//  NodeFactory.swift
//  CoordinatorProject
//
//  Created by Igor Fereira on 16/01/2017.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import UIKit

public protocol Node {}
extension UIViewController: Node {}

public enum NodeType {
    case brownViewController
    case greenViewController
    case blueViewController
    case redViewController
    case coordinator1(navigationController: UINavigationController)
    case coordinator2(navigationController: UINavigationController)
}

public struct NodeFactory {
    
    public func loadNode<T:Node>(node:NodeType) -> T? {
        switch node{
        case .brownViewController:
            return BrownViewController() as? T
        case .greenViewController:
            return GreenViewController() as? T
        case .blueViewController:
            return BlueViewController() as? T
        case .redViewController:
            return RedViewController() as? T
        case .coordinator1(let navigationController):
            return Coordinator1(with: navigationController) as? T
        case .coordinator2(let navigationController):
            return Coordinator2(with: navigationController) as? T
        }
    }
}
