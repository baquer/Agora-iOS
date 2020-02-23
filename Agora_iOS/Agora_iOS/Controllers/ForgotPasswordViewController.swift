//
//  ForgotPasswordViewController.swift
//  Agora_iOS
//
//  Created by Syed on 24/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    
    
    @IBOutlet weak var userNameTextField: UITextField!    
    @IBOutlet weak var sendLinkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAttributes()
    }
    
    func setUpAttributes() {
        sendLinkButton.layer.cornerRadius = 25.0
        Utilities.styleTextField(userNameTextField)
    }

}
