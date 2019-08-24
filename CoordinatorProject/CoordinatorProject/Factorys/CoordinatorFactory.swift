//
//  CoordinatorFactory.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 31/07/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    func makeCoordinatorRed(root: UINavigationController?, finish: @escaping finishCoordinatorRed) -> CoordinatorRed
    func makeCoordinatorBlue(root: UINavigationController?, finish: @escaping finishCoordinatorBlue) -> CoordinatorBlue
}

struct CoordinatorFactoryImp: CoordinatorFactory {
    func makeCoordinatorRed(root: UINavigationController?, finish: @escaping finishCoordinatorRed) -> CoordinatorRed {
        let red = CoordinatorRed(presentable: Presentable(root: root))
        red.finish = finish
        return red
    }
    
    func makeCoordinatorBlue(root: UINavigationController?, finish: @escaping finishCoordinatorBlue) -> CoordinatorBlue {
        let blue = CoordinatorBlue(presentable: Presentable(root: root))
        blue.finish = finish
        return blue
    }
}
