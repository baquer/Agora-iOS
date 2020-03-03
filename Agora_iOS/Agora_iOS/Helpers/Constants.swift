//
//  Constants.swift
//  Agora_iOS
//
//  Created by Syed on 26/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    struct securityQuestions {
        static let quesOne = "What is your Mother's maiden name?"
        static let quesTwo = "What was your childhood nickname?"
        static let quesThree = "What is the name of your favourite childhood friend?"
        static let quesFour = "In what city or town was your first job?"
        static let quesFive = "What was the last name of the third grade teacher?"
    }
    
    struct APIURL {
        static let loginURL = "https://agora-rest-api.herokuapp.com/api/v1/auth/login"
    }
    
    struct responseMessages {
        static let invalidParams = "Email ID / Password incorrect"
        static let serverError = "Problem connecting to server!"
        static let successMessageLogin = "Successfully Logged In"
        static let checkParameter = "Please Check Parameters Entered"
        static let invalidURL = "Error: invalid URL"
        static let requestMethod = "makeRequestMethod"
    }
    
    struct headerParamKeys {
        static let contentType = "Content-Type"
        static let json = "application/json"
    }
    
    struct userDefaultParamKeys {
        static let userName = "userName"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "email"
        static let expiresOn = "expiresOn"
        static let token = "token"
    }
    
    struct errorMessages {
        static let userNameError = "Please enter a user name"
        static let passwordError = "Please enter a valid password"
    }
    
    struct loginParameters {
        static let identifier = "identifier"
        static let password = "password"
    }
    
    struct loginDatakey {
        static let userName = "username"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "email"
        static let expiresOn = "expiresOn"
        static let token = "token"
    }
    
    struct segueIdentifier {
        static let dashboardSegue = "DashboardVC"
    }
    
    struct resetConst {
        static let baseURL = "https://agora-rest-api.herokuapp.com"
        static let methodURL = "/api/v1/auth/forgotPassword/send/"
        static let successMessage = "Reset link Sent successfully"
        static let failureMessage = "Reset Link sent successfully"
        static let paramaters = "userName"
    }
}
