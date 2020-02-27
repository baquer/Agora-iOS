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
}
