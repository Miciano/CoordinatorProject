//
//  Coordinator.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 31/07/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var root: UINavigationController? { get set }
    func start()
}
