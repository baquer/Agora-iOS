//
//  ForgotPasswordViewController.swift
//  Agora_iOS
//
//  Created by Syed on 24/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit
import Material

class ForgotPasswordViewController: UIViewController {
    
    
    
    @IBOutlet weak var userNameTextField: TextField!
    @IBOutlet weak var sendLinkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAttributes()
    }
    
    func setUpAttributes() {
        sendLinkButton.layer.cornerRadius = 25.0
        userNameTextField.dividerNormalColor = UIColor.systemOrange
        userNameTextField.dividerActiveColor = UIColor.systemOrange
    }

}
