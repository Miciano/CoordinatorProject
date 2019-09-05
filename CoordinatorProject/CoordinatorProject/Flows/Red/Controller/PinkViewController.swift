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

class PinkViewController: UIViewController, Finish {
    
    typealias FinishAction = PinkAction
    var finishCompletion: ((UIViewController, PinkAction) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        self.callFinish(action: .finishPink)
    }
}
