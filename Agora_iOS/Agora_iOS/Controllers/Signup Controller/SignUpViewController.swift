//
//  SignUpViewController.swift
//  Agora_iOS
//
//  Created by Syed on 24/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit
import Material
import IQDropDownTextField

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: TextField!
    
    @IBOutlet weak var firstNameTextField: TextField!
    
    @IBOutlet weak var lastNameTextField: TextField!
    
    @IBOutlet weak var emailTextField: TextField!
    
    @IBOutlet weak var passwordTextField: TextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var quesDropDownTextField: IQDropDownTextField!

    @IBOutlet weak var ansTextField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAttributes()
    }
    
    func setUpAttributes() {
        signUpButton.layer.cornerRadius = 20.0
        passwordTextField.isVisibilityIconButtonEnabled = true
        passwordTextField.dividerNormalColor = UIColor.systemOrange
        passwordTextField.dividerActiveColor = UIColor.systemOrange
        userNameTextField.dividerNormalColor = UIColor.systemOrange
        userNameTextField.dividerActiveColor = UIColor.systemOrange
        firstNameTextField.dividerNormalColor = UIColor.systemOrange
        firstNameTextField.dividerActiveColor = UIColor.systemOrange
        lastNameTextField.dividerNormalColor = UIColor.systemOrange
        lastNameTextField.dividerActiveColor = UIColor.systemOrange
        emailTextField.dividerNormalColor = UIColor.systemOrange
        emailTextField.dividerActiveColor = UIColor.systemOrange
        ansTextField.dividerNormalColor = UIColor.systemOrange
        ansTextField.dividerActiveColor = UIColor.systemOrange
        quesDropDownTextField.isOptionalDropDown = false
        quesDropDownTextField.itemList = [Constants.securityQuestions.quesOne, Constants.securityQuestions.quesTwo, Constants.securityQuestions.quesThree, Constants.securityQuestions.quesFour, Constants.securityQuestions.quesFive]
        Utilities.styleTextField(quesDropDownTextField)
        firstNameTextField.placeholderLabel.text = "First Name"
        firstNameTextField.placeholderLabel.textColor = .white
        lastNameTextField.placeholderLabel.text = "Last Name"
        lastNameTextField.placeholderLabel.textColor = .white
        userNameTextField.placeholderLabel.text = "User Name"
        userNameTextField.placeholderLabel.textColor = .white
        passwordTextField.placeholderLabel.text = "Password"
        passwordTextField.placeholderLabel.textColor = .white
        emailTextField.placeholderLabel.text = "Email"
        emailTextField.placeholderLabel.textColor = .white
        ansTextField.placeholderLabel.text = "Write Your Answer here"
        ansTextField.placeholderLabel.textColor = .white
    }

}
