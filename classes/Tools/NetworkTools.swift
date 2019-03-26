//
//  NetworkTools.swift
//  testAlamofire
//
//  Created by 雷志明 on 2018/12/13.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools {
    class func requestData(type : MethodType , URLString : String , parameters : [String : NSString]? = nil , finishedCallback : @escaping (_ result : AnyObject) -> ()) {
        
        let method1 = (type == .GET ? HTTPMethod.get : HTTPMethod.post)
        
        Alamofire.request(URLString, method: method1 , parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else{
                print(response.result.error as Any)
                return
            }
            finishedCallback(result as AnyObject)
        }
    
    }
    
}
