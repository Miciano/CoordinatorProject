//
//  CoordinatorBlue.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import Foundation

typealias finishCoordinatorBlue = ((_ blue: CoordinatorBlue)->Void)
protocol FinishinBlue {
    var finish: finishCoordinatorBlue? { get set }
}

final class CoordinatorBlue: Coordinator, FinishinBlue {
    
    private let presentable: Presentable
    private let factory = ControllerFactoryImp()
    var finish: finishCoordinatorBlue?
    
    init(presentable: Presentable) {
        self.presentable = presentable
    }
    
    func start() {
        self.makeBlueController()
    }
    
    func makeBlueController() {
        guard let controller = try? factory.makeBlueController() else { return }
        controller.delegate = self
        self.presentable.setRoot(controller: controller)
    }
    
    func makeIceBlueController() {
        guard let controller = try? factory.makeIceBlueController() else { return }
        controller.delegate = self
        self.presentable.push(controller: controller, animated: true)
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

extension CoordinatorBlue: FinishControllerProtocol {
    func finishController<T>(action: T) {
        if let action = action as? BlueAction {
            self.finishBlue(action: action)
            return
        }
        
        if let action = action as? IceBlueAction {
            self.finishIceBlue(action: action)
            return
        }
    }
}
