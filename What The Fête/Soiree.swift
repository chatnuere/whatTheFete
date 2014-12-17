//
//  Soiree.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 16/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class Soiree: NSObject {
    
    var id:Int!
    var name:String!
    var soireeDescription:String!
    var date:Int!
    var pictureurl:String!
    var participants:Int!
    var ratedParticipants:Int!
    var currentUserRate : Int!
    
    init( id:Int!, name:String!, soireeDescription:String!, date:Int!, pictureurl:String!, participants:Int!, ratedParticipants:Int!, currentUserRate : Int! ) {
        
        self.id                = id
        self.name              = name
        self.soireeDescription = soireeDescription
        self.date              = date
        self.pictureurl        = pictureurl
        self.participants      = participants
        self.ratedParticipants = ratedParticipants
        self.currentUserRate   = currentUserRate
        
    }
}
