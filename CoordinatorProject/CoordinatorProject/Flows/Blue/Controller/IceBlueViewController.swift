//
//  IceBlueViewController.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 21/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit
enum IceBlueAction {
    case finishIce
}

class IceBlueViewController: UIViewController {
    var delegate: FinishControllerProtocol?
    
    @IBAction func finishAction(_ sender: UIButton) {
        self.delegate?.finishController(action: IceBlueAction.finishIce)
    }
}
