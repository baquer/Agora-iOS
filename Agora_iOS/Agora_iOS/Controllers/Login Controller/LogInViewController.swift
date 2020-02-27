//
//  LogInViewController.swift
//  Agora_iOS
//
//  Created by Syed on 24/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit
import Material

class LogInViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var userNameTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttributes()
        addDelegates()
        loginButtonPressed()
    }
    
    func setUpAttributes() {
        loginButton.layer.cornerRadius = 20.0
        passwordTextField.isVisibilityIconButtonEnabled = true
        passwordTextField.dividerNormalColor = UIColor.systemOrange
        passwordTextField.dividerActiveColor = UIColor.systemOrange
        userNameTextField.dividerNormalColor = UIColor.systemOrange
        userNameTextField.dividerActiveColor = UIColor.systemOrange
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
}
