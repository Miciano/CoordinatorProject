//
//  BlueViewController.swift
//  CoordinatorsDemo
//
//  Created by Fabio Miciano on 21/08/2019.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit
enum BlueAction {
    case finishBlue
}

class BlueViewController: UIViewController, Finish {
    
    typealias FinishAction = BlueAction
    var finishCompletion: ((UIViewController, BlueAction) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishAction(_ sender: UIButton) {
        self.callFinish(action: .finishBlue)
    }
}
