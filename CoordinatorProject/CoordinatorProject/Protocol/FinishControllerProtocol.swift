//
//  FinishControllerProtocol.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 14/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

protocol Finish {
    associatedtype FinishAction
    var finishCompletion: ((UIViewController, FinishAction) -> Void)? { get set }
}

extension Finish where Self: UIViewController{
    func callFinish(action: FinishAction) {
        self.finishCompletion?(self, action)
    }
}
