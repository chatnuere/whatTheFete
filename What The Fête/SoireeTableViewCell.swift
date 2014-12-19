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
    @IBOutlet weak var soireeDateMonth: UILabel!
    @IBOutlet weak var soireeDateDay: UILabel!
    @IBOutlet weak var soireeCoverpic: UIImageView!
    
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
        
        let splitedDate         = split(soiree.date){$0 == "-"}
        let soireeDay           = splitedDate[0]
        
        var soireeMonth : String
        
        switch splitedDate[1] {
        case "01" :
            soireeMonth         = "JAN"
            break
        case "02" :
            soireeMonth         = "FEV"
            break
        case "03" :
            soireeMonth         = "MAR"
            break
        case "04" :
            soireeMonth         = "AVR"
            break
        case "05" :
            soireeMonth         = "MAI"
            break
        case "06" :
            soireeMonth         = "JUN"
            break
        case "07" :
            soireeMonth         = "JUL"
            break
        case "08" :
            soireeMonth         = "AOU"
            break
        case "09" :
            soireeMonth         = "SEP"
            break
        case "10" :
            soireeMonth         = "OCT"
            break
        case "11" :
            soireeMonth         = "NOV"
            break
        case "12" :
            soireeMonth         = "DEC"
            break
        default   :
            soireeMonth         = "No"
            break
            
        }
        
        
        
        soireeDateMonth.text    = soireeMonth
        soireeDateDay.text      = soireeDay

        ImageLoader.sharedLoader.imageForUrl(soiree.coverpic, completionHandler:{(image: UIImage?, url: String) in
            self.soireeCoverpic.image = image
        })
        
    }
}