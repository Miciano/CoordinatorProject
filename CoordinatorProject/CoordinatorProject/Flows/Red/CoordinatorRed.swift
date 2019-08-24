//
//  CoordinatorRed.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 31/07/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import Foundation

typealias finishCoordinatorRed = ((_ red: CoordinatorRed)->Void)
protocol FinishinRed {
    var finish: finishCoordinatorRed? { get set }
}

final class CoordinatorRed: Coordinator, FinishinRed {
    
    private let presentable: Presentable
    private let factory = ControllerFactoryImp()
    var finish: finishCoordinatorRed?
    
    init(presentable: Presentable) {
        self.presentable = presentable
    }
    
    func start() {
        self.makeRedController()
    }
    
    func makeRedController() {
        guard let controller = try? factory.makeRedController() else { return }
        controller.delegate = self
        self.presentable.setRoot(controller: controller)
    }
    
    func makeWineController() {
        guard let controller = try? factory.makeWineController() else { return }
        controller.delegate = self
        self.presentable.push(controller: controller, animated: true)
    }
    
    func makePinkController() {
        guard let controller = try? factory.makePinkController() else { return }
        controller.delegate = self
        self.presentable.push(controller: controller, animated: true)
    }
    
    private func finishRed(action: RedAction) {
        switch action {
        case .finishRed:
            self.makePinkController()
        }
    }
    
    private func finishWine(action: WineAction) {
        switch action {
        case .finishWine:
            self.finish?(self)
        }
    }
    
    private func finishPink(action: PinkAction) {
        switch action {
        case .finishPink:
            self.makeWineController()
        }
    }
}

extension CoordinatorRed: FinishControllerProtocol {
    func finishController<T>(action: T) {
        if let action = action as? RedAction {
            self.finishRed(action: action)
            return
        }
        
        if let action = action as? PinkAction {
            self.finishPink(action: action)
            return
        }
        
        if let action = action as? WineAction {
            self.finishWine(action: action)
            return
        }
    }
}
