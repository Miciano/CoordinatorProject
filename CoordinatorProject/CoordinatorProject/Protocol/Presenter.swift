//
//  Presenter.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit
typealias emptyClosure = (()->Void)

protocol Presenter {
    func present(controller: UIViewController, animated: Bool, completion: emptyClosure?)
    func push(controller: UIViewController, animated: Bool)
    func dismiss(animated: Bool, completion: emptyClosure?)
    func pop(animated: Bool)
    func popToViewController(controller: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
    func setRoot(controller: UIViewController)
}

extension Presenter where Self: Coordinator {
    func present(controller: UIViewController, animated: Bool, completion: emptyClosure?) {
        self.root?.present(controller, animated: animated.animatedWithEnviroment(), completion: completion)
    }
    
    func push(controller: UIViewController, animated: Bool) {
        self.root?.pushViewController(controller, animated: animated.animatedWithEnviroment())
    }
    
    func dismiss(animated: Bool, completion: emptyClosure?) {
        self.root?.dismiss(animated: animated.animatedWithEnviroment(), completion: completion)
    }
    
    func pop(animated: Bool) {
        self.root?.popViewController(animated: animated.animatedWithEnviroment())
    }
    
    func popToViewController(controller: UIViewController, animated: Bool) {
        self.root?.popToViewController(controller, animated: animated.animatedWithEnviroment())
    }
    
    func popToRoot(animated: Bool) {
        self.root?.popToRootViewController(animated: animated.animatedWithEnviroment())
    }
    
    func setRoot(controller: UIViewController) {
        self.root?.popToRootViewController(animated: false)
        self.root?.setViewControllers([controller], animated: true)
    }
}
