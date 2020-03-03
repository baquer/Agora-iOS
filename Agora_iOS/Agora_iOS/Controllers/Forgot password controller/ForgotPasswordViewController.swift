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
    
    
    // Declare textield and sendlink button
    @IBOutlet weak var userNameTextField: TextField!
    @IBOutlet weak var sendLinkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAttributes()
        resetButtonPressed()
    }
    
    
    // atributes setup function
    func setUpAttributes() {
        sendLinkButton.layer.cornerRadius = 25.0
        userNameTextField.dividerNormalColor = UIColor.systemOrange
        userNameTextField.dividerActiveColor = UIColor.systemOrange
    }
    
    func resetPassword(_ params: [String: AnyObject], _ completion: @escaping(_ success: Bool, _ results: [String: AnyObject]?, _ error: String) -> Void) {
        
        let userName: String = userNameTextField.text!
        let url = Client.sharedInstance.getApiUrl(Constants.resetConst.baseURL,Constants.resetConst.methodURL,"\(userName)")
        _ = Client.sharedInstance.makeRequest(url, .post, [:], parameters: params, completion: { (results, status, message) in

               if results != nil && status == 200 {
                   completion(true, results as? [String: AnyObject], "success")
               } else {
                   completion(false, nil, "fail")
               }
               return
           })

    }
    
    @objc func resetPasswordPerformed() {
        let params: [String: AnyObject] = [
            Constants.resetConst.paramaters: userNameTextField.text as AnyObject
            ]
        resetPassword(params as [String: AnyObject]) { (success, result, message) in
            DispatchQueue.main.async {
                if success {
                    self.view.makeToast(Constants.resetConst.successMessage)
                } else {
                    self.view.makeToast(Constants.resetConst.failureMessage)
                }
            }
        }
    }
     func resetButtonPressed() {
        sendLinkButton.addTarget(self, action: #selector(resetPasswordPerformed), for: .touchUpInside)
    }
}
