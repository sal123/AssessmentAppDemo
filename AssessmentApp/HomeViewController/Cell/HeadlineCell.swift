//
//  HeadlineCell.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
import AlamofireImage
class HeadlineCell: UITableViewCell {
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var HeadlineBy: UILabel!
    @IBOutlet weak var PostedDate: UILabel!
    @IBOutlet weak var Thumbnail: RoundImage!
    var model:MostViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(model:MostViewModel){
        self.model = model
        self.Title.text = self.model.title
        self.HeadlineBy.text = self.model.byline
        self.PostedDate.text = self.model.published_date
        self.Thumbnail.af_setImage(withURL: URL(string: self.model.media[0].media_metadata[0].url!)! )

        
    }


}
