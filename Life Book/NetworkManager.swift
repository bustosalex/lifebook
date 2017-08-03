//
//  NetworkManager.swift
//  Life Book
//
//  Created by Alexander Bustos on 8/3/17.
//  Copyright © 2017 App Factory. All rights reserved.
//

import Foundation
import Alamofire

var url = "http://lifebookbuilder.cloudapp.net:3000/api/"

class NetworkManager {
    
    static func registerUser(email: String, username: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
        url = url + "users/register"
        var requestError: Error? = nil
        let parameters: Parameters = [
            "email": email,
            "username": username,
            "password": password
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            debugPrint(response)
            if response.error != nil {
                requestError = response.error
            }
            if let statusCode = response.response?.statusCode{
                if statusCode > 210 {
                    requestError = NSError(domain: "Error code", code: statusCode, userInfo: nil)
                }
            }
        }
        completion(requestError)
    }
    
    static func login(username: String, password: String, completion: @escaping (_ error: Error?,_ token: String?,_ username: String) -> Void) {
        url = url + "users/authorize"
        var requestError: Error? = nil
        var token: String? = nil
        let _username = username
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            debugPrint(response)
            if response.error != nil {
                requestError = response.error
            }
            if let results = response.result.value as? [String: Any] {
                if let message = results["message"] as? String{
                    let userInfo = [
                        NSLocalizedDescriptionKey: NSLocalizedString(message, comment: "Please reenter Username or password and try again")
                    ]
                    requestError = NSError(domain: "Failed Authorization", code: 0, userInfo: userInfo)
                    
                }
                token  = results["token"] as? String
            }
            completion(requestError, token, _username)

        }
    }
}
