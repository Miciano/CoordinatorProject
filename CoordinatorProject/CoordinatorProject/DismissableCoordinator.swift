//
//  DismissableCoordinator.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

typealias DismissCoordinator = (Void)-> Void

protocol DismissableCoordinator
{
    var dismissAction: DismissCoordinator { get set }
}

extension DismissableCoordinator where Self:CoordinatorProtocol
{
    func callDismiss() {
        self.dismissAction()
    }
}
