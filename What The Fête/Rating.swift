//
//  Rating.swift
//  What The Fête
//
//  Created by Pierre-Jean DUGUÉ on 18/12/2014.
//  Copyright (c) 2014 Pierre-Jean DUGUÉ. All rights reserved.
//

import UIKit

class Rating: NSObject {
    
    
    var alcohol:Float!
    var dance:Float!
    var women:Float!
    var swag:Float!
    var fun:Float!

    
    init(  alcohol:Float!, dance:Float!, women:Float!, swag:Float!, fun:Float!) {
        
        self.alcohol = alcohol
        self.dance   = dance
        self.women   = women
        self.swag    = swag
        self.fun     = fun

    }
    
}
