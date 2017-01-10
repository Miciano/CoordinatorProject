//
//  ActionView.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 10/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

typealias Handler = ((Void)->Void)?
protocol ActionView {
    var handler: Handler { get set }
    func actionForCoordinator()
}
