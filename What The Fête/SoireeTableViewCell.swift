//
//  SoireeTableViewCell.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class SoireeTableViewCell: UITableViewCell {

    @IBOutlet weak var soireeTitle: UILabel!
    @IBOutlet weak var soireeDescription: UILabel!
    @IBOutlet weak var soireeDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setSoiree(soiree:Soiree) {
        soireeTitle.text        = soiree.title
        soireeDescription.text  = soiree.soireeDescription
        soireeDate.text         = soiree.date
    }
}