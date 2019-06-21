//
//  VProjectListTableViewCell.swift
//  FireStorePOC
//
//  Created by Randhir Kumar on 10/05/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import UIKit

class VProjectListTableViewCell: UITableViewCell {

    @IBOutlet weak var aOrderIdLabel: UILabel!
    @IBOutlet weak private var aTitleLabel: UILabel!
    @IBOutlet weak private var aSubTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(withModel valtitudeModel: ValtitudeModel, isEnglishText: Bool)  {
        if isEnglishText {
            self.aTitleLabel.text = valtitudeModel.english_text?.header
            self.aSubTitleLabel.text = valtitudeModel.english_text?.description
        } else {
            self.aTitleLabel.text = valtitudeModel.german_text?.header
            self.aSubTitleLabel.text = valtitudeModel.german_text?.description
        }
        if let id = valtitudeModel.order {
            aOrderIdLabel.text = "\(id)"
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
