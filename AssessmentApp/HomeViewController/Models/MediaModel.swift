//
//  MediaModel.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
class MediaModel: NSObject {
    override init() {
        super.init()
    }
   @objc var type:String = ""
  @objc  var caption:String =  ""
  @objc  var media_metadata:[Media_metadataModel] = [Media_metadataModel]()

}
