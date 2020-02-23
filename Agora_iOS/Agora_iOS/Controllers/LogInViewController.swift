//
//  LogInViewController.swift
//  Agora_iOS
//
//  Created by Syed on 24/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttributes()
    }
    
    func setUpAttributes() {
        loginButton.layer.cornerRadius = 20.0
        Utilities.styleTextField(userNameTextField)
        Utilities.styleTextField(passwordTextField)
    }
}
