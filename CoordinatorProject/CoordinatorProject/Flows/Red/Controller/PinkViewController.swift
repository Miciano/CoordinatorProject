//
//  PinkViewController.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

enum PinkAction {
    case finishPink
}

class PinkViewController: UIViewController {
    
    var delegate: FinishControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        self.delegate?.finishController(action: PinkAction.finishPink)
    }
}
