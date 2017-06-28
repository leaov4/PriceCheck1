//
//  PriceCheckCar.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import Foundation

class PriceCheckCar {
    
    var make: String?
    var model: String?
    var year: String?
    var price: String?
    
    init?(make: String?, model: String?, year: String?, price: String?){
        self.make = make
        self.model = model
        self.year = year
        self.price = price
    }
    
    
}
