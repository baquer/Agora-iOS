//
//  DashboardViewController.swift
//  Agora_iOS
//
//  Created by Syed on 28/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var menuVisible = false
    
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func menuPresed(_ sender: Any) {
        
        if !menuVisible {
            leading.constant = 200
            trailing.constant = -200
            menuVisible = true
        } else {
            leading.constant = 0
            trailing.constant = 0
            menuVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
        }
    }
    
}
