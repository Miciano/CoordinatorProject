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

class WineViewController: UIViewController, Finish {
    
    typealias FinishAction = WineAction
    var finishCompletion: ((UIViewController, WineAction) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        self.callFinish(action: .finishWine)
    }
}
