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
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var peopleRatinView: UIView!
    @IBOutlet weak var peopleRatingText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUser(user:User, peoples:[People]=[People]()) {
        userNameLabel.text      = "\(user.firstname) \(user.lastname)"
        userTitle.text          = user.user_title
        
        
        //Construct the imgUrl to get an image URL for the pages
        let urlString: NSString = user.pictureurl as NSString
        var imgURL: NSURL       = NSURL(string: urlString)!
        var imgData: NSData     = NSData(contentsOfURL: imgURL)!
        
        ///append each image into UIImage
        userPicture.image    = UIImage(data: imgData)!
        
        
        
        // loking for the mark
        for people in peoples {
            if people.user_id == user.userId && people.mark != "null" {
                peopleRatingText.text = people.mark
                peopleRatinView.backgroundColor = UIColor(red: 0.207843, green: 0.403922, blue: 0.988235, alpha: 1)
            }
        }
        
        
        
    }
    
}
