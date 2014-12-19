//
//  UserCollectionViewCell.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 19/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    func setUser(user:User){
        
        ImageLoader.sharedLoader.imageForUrl(user.pictureurl, completionHandler:{(image: UIImage?, url: String) in
            self.userImage.image = image
        })
        
        
        
    }
}
