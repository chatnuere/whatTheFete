//
//  SoireeTableViewCell.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class SoireeTableViewCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setSoiree(soiree:Soiree) {
//        soireeTitleLabel.text=soiree.title
//        videoGameRatingLabel.text="\(soiree.rating)"
    }
}

//
//self.id                = id
//self.name              = name
//self.description       = description
//self.date              = date
//self.pictureurl        = pictureurl
//self.participants      = participants
//self.ratedParticipants = ratedParticipants
//self.currentUserRate   = currentUserRate