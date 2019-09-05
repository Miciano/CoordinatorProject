//
//  ControllerFactory.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import Foundation

protocol ControllerFactory {
    func makeRedController() throws -> RedViewController
    func makeWineController() throws -> WineViewController
    func makePinkController() throws -> PinkViewController
    
    func makeBlueController() throws -> BlueViewController
    func makeIceBlueController() throws -> IceBlueViewController
}

struct ControllerFactoryImp: ControllerFactory {
    func makeRedController() throws -> RedViewController {
        guard let controller = Bundle.main.loadNibNamed("RedViewController", owner: nil, options: nil)?.last as? RedViewController else { throw Errors.notFindNib }
        return controller
        
    }
    
    func makeWineController() throws -> WineViewController {
        guard let controller = Bundle.main.loadNibNamed("WineViewController", owner: nil, options: nil)?.last as? WineViewController else { throw Errors.notFindNib }
        return controller
    }
    
    func makePinkController() throws -> PinkViewController {
        guard let controller = Bundle.main.loadNibNamed("PinkViewController", owner: nil, options: nil)?.last as? PinkViewController else { throw Errors.notFindNib }
        return controller
    }
    
    func makeBlueController() throws -> BlueViewController {
        guard let controller = Bundle.main.loadNibNamed("BlueViewController", owner: nil, options: nil)?.last as? BlueViewController else { throw Errors.notFindNib }
        return controller
    }
    
    func makeIceBlueController() throws -> IceBlueViewController {
        guard let controller = Bundle.main.loadNibNamed("IceBlueViewController", owner: nil, options: nil)?.last as? IceBlueViewController else { throw Errors.notFindNib }
        return controller
    }
}
