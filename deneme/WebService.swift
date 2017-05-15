//
//  WebService.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

private var baseUrl = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.wired.com%2Ffeed%2F"

class WebService {
    
    class func request<T: Mappable>(uri: String, methot: HTTPMethod, parameters: [String: AnyObject]?, success: @escaping (T) -> Void, failure: @escaping (Error) -> Void) {
        
        let headers: HTTPHeaders = [:]
        
        let url = "\(baseUrl)\(uri)"
        var encoding: ParameterEncoding!
        
        switch methot {
        case .get:
            encoding = URLEncoding.default
        case .put:
            encoding = URLEncoding.default
        case .delete:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.default
            break
        }
        
        // Original URL request
        
        Alamofire.request(url, method: methot, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseJSON { response in
                
                // Success
                if response.result.isSuccess {
                    // print("\nResponse Data: \(response.result.value!)")
                    
                    // JSON Data
                    if let object = Mapper<T>().map(JSON: response.result.value as! [String: Any]) {
                        success(object)
                        return
                    }
                    print("\nBuraya girmemeli")
                }
                
                // Failure
                if response.result.isFailure {
                    if let value = response.data {
                        let responseData = String.init(data: value, encoding: String.Encoding.utf8)
                        
                        //   print("\nResponse Data: \(responseData)")
                        if let error = Mapper<Error>().map(JSONString: responseData!) {
                            failure(error)
                            return
                        }
                        
                    }
                    
                    if response.result.error != nil {
                        failure(Error(code: "unknown_error", error: "Beklenmedik bir hata oluştu."))
                        return
                    }
                    
                    print("\nBuraya girmemeli")
                }
        }
    }
    
    class func request<T: Mappable>(uri: String, methot: HTTPMethod, parameters: [String: AnyObject]?, success: @escaping ([T]) -> Void, failure: @escaping (Error) -> Void) {
        
        let headers: HTTPHeaders = [:]
        
        let url = "\(baseUrl)\(uri)"
        var encoding: ParameterEncoding!
        
        switch methot {
        case .get:
            encoding = URLEncoding.default
        case .put:
            encoding = URLEncoding.default
        case .delete:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.default
            break
        }
        
        // Original URL request
        
        Alamofire.request(url, method: methot, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseJSON { response in
                
                // Success
                if response.result.isSuccess {
                    //  print("\nResponse Data: \(response.result.value!)")
                    // JSON Data
                    if let object = Mapper<T>().mapArray(JSONArray: response.result.value as! [[String : Any]]) {
                        success(object)
                        return
                    }
                    //  print("\nBuraya girmemeli")
                }
                
                // Failure
                if response.result.isFailure {
                    if let value = response.data {
                        let responseData = String.init(data: value, encoding: String.Encoding.utf8)
                        
                        //  print("\nResponse Data: \(responseData)")
                        if let error = Mapper<Error>().map(JSONString: responseData!) {
                            failure(error)
                            return
                        }
                        
                    }
                    
                    if response.result.error != nil {
                        failure(Error(code: "unknown_error", error: "Beklenmedik bir hata oluştu."))
                        return
                    }
                    
                    print("\nBuraya girmemeli")
                }
        }
    }
    
    // SendCommentWebService
    
    class func requestt(uri: String, methot: HTTPMethod, parameters: [String: AnyObject]?, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        
        let headers: HTTPHeaders = [:]
        
        let url = "\(baseUrl)\(uri)"
        var encoding: ParameterEncoding!
        
        switch methot {
        case .get:
            encoding = URLEncoding.default
        case .put:
            encoding = URLEncoding.default
        case .delete:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.default
            break
        }
        
        // Original URL request
        
        Alamofire.request(url, method: methot, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseJSON { response in
                
                // Success
                if response.result.isSuccess {
                    success()
                    return
                    //    }
                }
                
                // Failure
                if response.result.isFailure {
                    if let value = response.data {
                        let responseData = String.init(data: value, encoding: String.Encoding.utf8)
                        
                        if let error = Mapper<Error>().map(JSONString: responseData!) {
                            failure(error)
                            return
                        }
                        
                    }
                    
                    if response.result.error != nil {
                        failure(Error(code: "unknown_error", error: "Beklenmedik bir hata oluştu."))
                        return
                    }
                    
                }
                
                
        }
    }
    
}
