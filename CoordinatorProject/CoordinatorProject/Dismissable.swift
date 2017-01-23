//
//  Dismissable.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

typealias DismissViewController = (UIViewController)-> Void
typealias DismissCoordinator = (Void)-> Void

protocol Dismissable
{
    associatedtype DismissableObject
    var dismissAction: (DismissableObject)->Void { get set }
}

extension Dismissable where Self:UIViewController, DismissableObject == UIViewController
{
    func callDismiss() {
        self.dismissAction(self)
    }
}

extension Dismissable where DismissableObject == Void
{
    func callDismiss() {
        self.dismissAction()
    }
}
