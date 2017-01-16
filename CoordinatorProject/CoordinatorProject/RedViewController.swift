//
//  RedViewController.swift
//  CoordinatorProject
//
//  Created by Fabio Miciano on 09/01/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class RedViewController: UIViewController, Dismissable
{
    var dismissAction: DismissViewController = {_ in }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        guard let view = Bundle.main.loadNibNamed("RedView", owner: self, options: nil)?.last as? RedView else { return }
        view.handler = ({ _ in
            self.callDismiss()
        })
        
        self.view = view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
