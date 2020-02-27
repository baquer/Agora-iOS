//
//  Convenience.swift
//  Agora_iOS
//
//  Created by Syed on 27/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import Foundation
import Alamofire

extension Client {
    
    func loginUser(_ params: [String: AnyObject], _ completion: @escaping(_ success: Bool, _ results: [String: AnyObject]?, _ error: String) -> Void) {

        let url = Constants.APIURL.loginURL

        let headerLogin = [
            Constants.headerParamKeys.contentType: Constants.headerParamKeys.json
        ]
    _ = makeRequest(url, .post, headerLogin, parameters: params, completion: { (results, status, message) in

               if results != nil && status == 200 {
                completion(true, results as? [String: AnyObject], Constants.responseMessages.successMessageLogin)
               } else {
                completion(false, nil, Constants.responseMessages.invalidParams)
               }
               return
           })
    }
}
