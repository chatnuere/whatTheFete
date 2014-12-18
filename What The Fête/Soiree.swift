//
//  Soiree.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class Soiree: NSObject {
    
    var soireeId:Int!
    var title:String!
    var soireeDescription:String!
    var date:String!
    var coverpic:String!
    
    init( soireeId:Int!, title:String!, soireeDescription:String!, date:String!, coverpic:String! ) {
        
        self.soireeId          = soireeId
        self.title             = title
        self.soireeDescription = soireeDescription
        self.date              = date
        self.coverpic          = coverpic
        
    }
}
