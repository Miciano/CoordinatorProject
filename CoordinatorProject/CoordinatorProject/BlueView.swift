//
//  BlueView.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class BlueView: UIView, ActionView {
    
    var handler: SelfViewHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func changeAction(_ sender: UIButton) {
        actionForCoordinator()
    }
}
