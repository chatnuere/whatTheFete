//
//  UserTableViewCell.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 17/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUser(user:User) {
        userNameLabel.text        = "\(user.firstname) \(user.lastname)"
        
        
        //Construct the imgUrl to get an image URL for the pages
        let urlString: NSString = user.pictureurl as NSString
        var imgURL: NSURL       = NSURL(string: urlString)!
        var imgData: NSData     = NSData(contentsOfURL: imgURL)!
        
        ///append each image into UIImage
        userPicture.image    = UIImage(data: imgData)!
        
    }
    
}
