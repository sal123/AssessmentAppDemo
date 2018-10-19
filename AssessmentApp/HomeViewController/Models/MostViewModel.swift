//
//  MostViewModel.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
import SwiftyJSON
class MostViewModel: NSObject {

  override  init() {
        
    }
    @objc var title:String = ""
    @objc var type:String = ""
    @objc var published_date:String = ""
    @objc var media:[MediaModel] = [MediaModel]()
    @objc var caption:String = ""
    @objc var url: String = ""
    @objc var byline : String = ""
}
