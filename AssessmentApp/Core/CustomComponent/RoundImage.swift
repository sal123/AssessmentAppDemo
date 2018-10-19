//
//  RoundImage.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
@IBDesignable
class RoundImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   
    @IBInspectable
    public var hasRoundImage:Bool = false {
        
        didSet{
            
            if hasRoundImage{
                self.layer.cornerRadius = self.frame.height/2
                self.layer.masksToBounds = true
                self.layoutSubviews()
            } else   {
                self.layer.cornerRadius = 0
                self.layer.masksToBounds = false
                self.layoutSubviews()
            }
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
