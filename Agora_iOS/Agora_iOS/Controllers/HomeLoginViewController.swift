//
//  ViewController.swift
//  Agora_iOS
//
//  Created by Syed on 22/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit

class HomeLoginViewController: UIViewController {
    
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAttributes()
    }
    
    func setButtonAttributes() {
        signUpButton.layer.cornerRadius = 20.0
        facebookLoginButton.layer.cornerRadius = 20.0
        loginButton.layer.cornerRadius = 20.0
    }


}

