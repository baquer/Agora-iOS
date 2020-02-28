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
            performLogin()
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
            return true
        }
        if let password = passwordTextField.text, password.isEmpty {
            return true
        }
        return true
    }
    
    
    // login function called using API and validation
    
    @objc func performLogin() {
      if isValid() {
            
            let userName = userNameTextField.text
            let password = passwordTextField.text
            
            let params: [String: AnyObject] = [
                Constants.loginParameters.identifier: userName as AnyObject,
                Constants.loginParameters.password: password as AnyObject
                ]
            Client.sharedInstance.loginUser(params as [String: AnyObject]) { (success, result, message) in
                DispatchQueue.main.async {
                    if success {
                        guard let email = result?[Constants.loginDatakey.email] as? String else {
                            fatalError("Unable to fetch email")
                        }
                        UserDefaults.standard.set(email, forKey: Constants.userDefaultParamKeys.email)
                        guard let firstName = result?[Constants.loginDatakey.firstName] as? String else {
                            fatalError("Unable to find first name")
                        }
                        UserDefaults.standard.set(firstName, forKey: Constants.userDefaultParamKeys.firstName)
                        guard let lastName = result?[Constants.loginDatakey.lastName] as? String else {
                            fatalError("Unable to find last name")
                        }
                        UserDefaults.standard.set(lastName, forKey: Constants.userDefaultParamKeys.lastName)
                        guard let userName = result?[Constants.loginDatakey.userName] as? String else {
                            fatalError("Unable to find user name")
                        }
                        UserDefaults.standard.set(userName, forKey: Constants.userDefaultParamKeys.userName)
                        for innerResult in result! {
                            if innerResult.key == Constants.loginDatakey.token {
                                guard let expiryTime = innerResult.value[Constants.loginDatakey.expiresOn] as? String else {
                                    fatalError("Unable to find expiry time")
                                }
                                UserDefaults.standard.set(expiryTime, forKey: Constants.userDefaultParamKeys.expiresOn)
                                guard let token = innerResult.value[Constants.loginDatakey.token] as? String else {
                                    fatalError("Unable to find access token")
                                }
                                UserDefaults.standard.set(token, forKey: Constants.userDefaultParamKeys.token)
                            }
                        }
                        self.performSegue(withIdentifier: Constants.segueIdentifier.dashboardSegue, sender: nil)
                    }
                }
            }
    } else if let password = passwordTextField.text, password.isEmpty {
        view.makeToast(Constants.errorMessages.passwordError)
    } else {
        view.makeToast(Constants.responseMessages.checkParameter)
        }
    }
}
