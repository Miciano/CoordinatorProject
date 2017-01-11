//
//  RedView.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class RedView: UIView, ActionView {
    
    var handler: Handler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func actionForCoordinator() {
        guard let handler = handler else { return }
        handler()
    }
    
    @IBAction func changeAction(_ sender: UIButton) {
        actionForCoordinator()
    }
}
