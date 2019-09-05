//
//  Bool+Animated.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import Foundation

extension Bool {
    //ISSO AQUI É FEITO CASO QUERIA VERIFICAR EM TESTE UNITARIO SE UM VIEWCONTROLLER APARECEU
    func animatedWithEnviroment() -> Bool {
        #if TEST
        return false
        #endif
        
        return self
    }
}
