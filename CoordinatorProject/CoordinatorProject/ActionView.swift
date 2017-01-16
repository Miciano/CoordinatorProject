//
//  ActionView.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 10/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import UIKit

//: Suggestion 4 - The same way that the Dismissable protocol
//: can use associated types to enhance declaration, the
//: ActionView can also use it

typealias EmptyHandler = ((Void)->Void)
typealias SelfViewHandler = ((UIView)->Void)

protocol ActionView {
    associatedtype ActionObject
    var handler: ((ActionObject)->Void)? { get set }
    func actionForCoordinator()
}

extension ActionView where Self:UIView, ActionObject == UIView {
    func actionForCoordinator() {
        guard let handler = self.handler else { return }
        handler(self)
    }
}

extension ActionView where ActionObject == Void {
    func actionForCoordinator() {
        guard let handler = self.handler else { return }
        handler()
    }
}
