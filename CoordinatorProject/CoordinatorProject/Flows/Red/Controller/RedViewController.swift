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

class RedViewController: UIViewController, Finish {
    
    typealias FinishAction = RedAction
    var finishCompletion: ((UIViewController, RedAction) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        self.callFinish(action: .finishRed)
    }
}
