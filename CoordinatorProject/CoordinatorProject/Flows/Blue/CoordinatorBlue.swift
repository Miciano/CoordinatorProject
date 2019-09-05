//
//  CoordinatorBlue.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

typealias finishCoordinatorBlue = ((_ blue: CoordinatorBlue)->Void)
protocol FinishinBlue {
    var finish: finishCoordinatorBlue? { get set }
}

final class CoordinatorBlue: Coordinator, FinishinBlue, Presenter {
    
    var root: UINavigationController?
    private let factory = ControllerFactoryImp()
    var finish: finishCoordinatorBlue?
    
    init(root: UINavigationController?) {
        self.root = root
    }
    
    func start() {
        self.makeBlueController()
    }
    
    func makeBlueController() {
        guard let controller = try? factory.makeBlueController() else { return }
        controller.finishCompletion = {(controller, action) in
            self.finishBlue(action: action)
        }
        self.setRoot(controller: controller)
    }
    
    func makeIceBlueController() {
        guard let controller = try? factory.makeIceBlueController() else { return }
        controller.finishCompletion = {[weak self] (controller, action) in
            self?.finishIceBlue(action: action)
        }
        self.push(controller: controller, animated: true)
    }
    
    
    private func finishBlue(action: BlueAction) {
        switch action {
        case .finishBlue:
            self.makeIceBlueController()
        }
    }
    
    private func finishIceBlue(action: IceBlueAction) {
        switch action {
        case .finishIce:
            self.finish?(self)
        }
    }
}

