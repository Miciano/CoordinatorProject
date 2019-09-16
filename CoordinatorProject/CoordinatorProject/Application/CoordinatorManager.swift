//
//  CoordinatorManager.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 31/07/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

final class CoordinatorManager: Coordinator {
    private let factory: CoordinatorFactory
    
    weak var root: UINavigationController?
    var currentCoordinator: Coordinator?
    
    init(root: UINavigationController?, factory: CoordinatorFactory) {
        self.root = root
        self.factory = factory
    }
    
    //MARK: -- STARTS --
    func start() {
        self.start(route: nil)
    }
    
    func start(route: Route?) {
        if let route = route {
            self.toDestiny(route: route)
            return
        }
        
        self.toDestiny(route: .red)
    }
    
    //MARK: -- FACTORY COORDINATORS --
    private func toDestiny(route: Route) {
        switch route {
        case .red:
            let red = self.factory.makeCoordinatorRed(root: self.root) {[weak self] (coordinator) in
                self?.currentCoordinator = nil
                self?.toDestiny(route: .blue)
            }
            self.currentCoordinator = red
            red.start()
        case .blue:
            let blue = self.factory.makeCoordinatorBlue(root: self.root) {[weak self] (coordinator) in
                self?.currentCoordinator = nil
                self?.toDestiny(route: .red)
            }
            self.currentCoordinator = blue
            blue.start()
        }
    }
}
