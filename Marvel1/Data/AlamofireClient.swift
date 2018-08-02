//
//  AlamofireClient.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation
import Alamofire

class AlamaofireClient {
    
    typealias closure = (Data?) -> Void
    
    func request(strURL: String, params: [String:Any]?,headers : [String : String]?, success: @escaping closure, failure: @escaping (NSError) -> Void) {
        
        _ = Alamofire.request(strURL, method: .get, parameters: params, encoding: URLEncoding.default , headers:nil).responseJSON {
            (responseObject) -> Void in
            
            //print(responseObject)
            
            if responseObject.result.isSuccess {
                let jsonData = responseObject.data
                success(jsonData)
            }
            if responseObject.result.isFailure {
                let error: NSError = responseObject.result.error! as NSError
                failure(error)
            }
        }
    }
}
