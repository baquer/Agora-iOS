//
//  LoginMethods.swift
//  Agora_iOS
//
//  Created by Syed on 28/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

extension LogInViewController: UITextFieldDelegate  {
    
    
    
    // Configure Login Button
    func loginButtonPressed() {
        loginButton.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
    }

    
    
    // Add Delegates
    func addDelegates() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Keyboard Return Key Hit
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            _ =  passwordTextField.becomeFirstResponder()
        case passwordTextField:
            dismissKeyboard()
            //performLogin()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    // force dismiss keyboard if open.
     func dismissKeyboard() {
        view.endEditing(true)
    }

    // Toggle Editing
    func toggleEditing() {
        userNameTextField.isEnabled = !userNameTextField.isEnabled
        passwordTextField.isEnabled = !passwordTextField.isEnabled
    }

    // Clear field after login
    func clearFields() {
        passwordTextField.text = ""
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
            if textField == passwordTextField, let password = passwordTextField.text {
            if password.isEmpty || password.count < 6 || password.count > 64 {
                passwordTextField.dividerActiveColor = .red
            } else {
                passwordTextField.dividerActiveColor = .green
            }
        }
    }
    
    // Validate fields
    func isValid() -> Bool {
        if let userID = userNameTextField.text, !userID.isEmpty {
            return false
        }
        if let password = passwordTextField.text, password.isEmpty {
            return false
        }
        return true
    }
    
    @objc func performLogin() {
        if isValid() {
            
        } else if let userID = userNameTextField.text, !userID.isEmpty {
            view.makeToast(Constants.errorMessages.userNameError)
        } else if let password = passwordTextField.text, password.isEmpty {
            view.makeToast(Constants.errorMessages.passwordError)
        }
    }
}
