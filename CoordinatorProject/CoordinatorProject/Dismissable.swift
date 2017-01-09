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

protocol Dismissable
{
    var dismissAction: DismissViewController { get set }
}

extension Dismissable where Self:UIViewController
{
    func callDismiss() {
        self.dismissAction(self)
    }
}
