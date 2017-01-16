//
//  CoordinatorProtocol.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: Node {
    
    var navigationController: UINavigationController { get }
    
    init(with navigationController: UINavigationController)
}
