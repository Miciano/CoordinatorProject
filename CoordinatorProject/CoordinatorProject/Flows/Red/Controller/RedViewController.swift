//
//  RedViewController.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 07/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit
enum RedAction {
    case finishRed
}

class RedViewController: UIViewController {
    
    var delegate: FinishControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        delegate?.finishController(action: RedAction.finishRed)
    }
}
