//
//  NetworkManager.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class NetworkManager: NSObject{
    let alamofireManager = Alamofire.SessionManager()
    enum ValidResponse:String{
        case Success = "OK"
        case Error = "ERROR"
    }
    
    func getData(url : String, params:Parameters? , method : HTTPMethod,headers:HTTPHeaders?, completionHandler:@escaping (_ success : Bool ,_ responseData : JSON)-> Void){
        
        if  !Connectivity.isConnectedToInternet(){
            var errorResponse = JSON.init()
            errorResponse["errors"] = [JSON.init(("No Internet "))]
            let response:JSON  =  ["status": "No Internet",
                                   "response":errorResponse]
            completionHandler(false,response)
            return
        }
        
        
     
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers
            ).responseJSON{  response in switch response.result {
                
            case .success(let json):
                print("Success with JSON: \(json)")
                let jsonResponse = JSON.init(json)
                var success = false
                if jsonResponse["status"].string == ValidResponse.Success.rawValue{
                    success = true
                }
                completionHandler(success , jsonResponse);

                
            case .failure(let error):
                print("Request failed with error: \(error)")
                var errorResponse = JSON.init()
                errorResponse["errors"] = [JSON.init(error.localizedDescription)]
                let response:JSON  =  ["status": "Error",
                                       "response":errorResponse]
                completionHandler(false,response)
                
                }
        }
    }

}

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

