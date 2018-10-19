//
//  MostViewService.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
import SwiftyJSON
class MostViewService: NSObject {
    let baseURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/"
  
    func getMostViewData(section:String,timePeriod:String,completionHandler:@escaping (_ success : Bool ,_ responseData : JSON)-> Void){
        
        
        NYTIMESManager.sharedInstance.networkManager.getData(url: "\(baseURL)\(section)/\(timePeriod).json", params: nil, method: .get, headers: ["api-key": "c7937986327142ac9cafcf45565e0b50"],completionHandler: { (success, response) in
                completionHandler(success,response)
        })
     
    }

}
