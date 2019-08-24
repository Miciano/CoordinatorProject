//
//  WineViewController.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

enum WineAction {
    case finishWine
}

class WineViewController: UIViewController {
    
    var delegate: FinishControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        self.delegate?.finishController(action: WineAction.finishWine)
    }
}
