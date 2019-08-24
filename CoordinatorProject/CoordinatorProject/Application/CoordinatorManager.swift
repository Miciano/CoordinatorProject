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
    
    private weak var root: UINavigationController?
    
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
            let red = self.factory.makeCoordinatorRed(root: self.root, finish: finishRed)
            red.start()
        case .blue:
            let blue = self.factory.makeCoordinatorBlue(root: self.root, finish: finishBlue)
            blue.start()
        }
    }

    //åMARK: -- FINISH FLOWS --
    func finishRed(red: CoordinatorRed) {
        self.toDestiny(route: .blue)
    }
    
    func finishBlue(blue: CoordinatorBlue) {
        self.toDestiny(route: .red)
    }
}
