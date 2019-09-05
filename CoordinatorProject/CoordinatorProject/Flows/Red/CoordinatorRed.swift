//
//  CoordinatorRed.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 31/07/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

typealias finishCoordinatorRed = ((_ red: CoordinatorRed)->Void)
protocol FinishinRed {
    var finish: finishCoordinatorRed? { get set }
}

final class CoordinatorRed: Coordinator, Presenter {
    
    var root: UINavigationController?
    private let factory = ControllerFactoryImp()
    var finish: finishCoordinatorRed?
    
    init(root: UINavigationController?) {
        self.root = root
    }
    
    func start() {
        self.makeRedController()
    }
    
    func makeRedController() {
        guard let controller = try? factory.makeRedController() else { return }
        controller.finishCompletion = {(controller, action) in
            self.finishRed(action: action)
        }
        
        self.setRoot(controller: controller)
    }
    
    func makeWineController() {
        guard let controller = try? factory.makeWineController() else { return }
        controller.finishCompletion = { [weak self] (controller, action) in
            self?.finishWine(action: action)
        }
        self.push(controller: controller, animated: true)
    }
    
    func makePinkController() {
        guard let controller = try? factory.makePinkController() else { return }
        controller.finishCompletion = { [weak self] (controller, action) in
            self?.finishPink(action: action)
        }
        self.push(controller: controller, animated: true)
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
