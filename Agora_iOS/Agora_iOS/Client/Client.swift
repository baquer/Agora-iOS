//
//  Client.swift
//  Agora_iOS
//
//  Created by Syed on 27/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import Foundation
import Alamofire

class Client: NSObject {

    static let sharedInstance = Client()
    var session: URLSession

    private override init() {
        session = URLSession.shared
    }
    
    func makeRequest(_ url: String, _ httpMethod: HTTPMethod, _ headers: HTTPHeaders, parameters: [String: AnyObject], completion: @escaping (_ result: AnyObject?,_ statuscode: Int?,_ error: NSError?) -> Void) {

        func sendError(_ error: String) {
            debugPrint(error)
            completion(nil, nil,NSError(domain: Constants.responseMessages.requestMethod, code: 1))
        }


        Alamofire.request(url, method: httpMethod, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<409)
            .responseJSON { (response: DataResponse<Any>) in

                print(response)
                print(response.request?.url ?? Constants.responseMessages.invalidURL)

                switch(response.result) {

                case .success(_):
                    if let data = response.result.value as? Dictionary<String, Any> {

                        completion(data as AnyObject?,response.response?.statusCode, nil)
                    }
                    else {
                        
                        completion(nil,nil, NSError(domain: Constants.responseMessages.serverError,code: 1))
                    }
                    break

                case .failure( _):
                    sendError(Constants.responseMessages.serverError)
                    break
                }
        }
    }
    
    func getApiUrl(_ apiUrl: String, _ method: String = "", _ param: String = "") -> String {
        return "\(apiUrl)\(method)\(param)"
    }
}

