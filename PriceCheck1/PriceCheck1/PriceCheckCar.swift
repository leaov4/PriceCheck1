//
//  PriceCheckCar.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import Foundation
import UIKit

class PriceCheckCar {
    
    var make: String?
    var model: String?
    var year: String?
    var price: String?
    var car_id: String?
    var dealer_id: String?
    var new_used: String?
    var mileage: String?
    var colour: String?
    var transmission: String?
    var body_type: String?
    var condition: String?
    var vin_number: String?
    var mm_code_id: String?
    var range: String?
    var fuel_type: String?
    
    var frontView: UIImage?
    var sideView: UIImage?
    var otherSideView: UIImage?

    init?(make: String?, model: String?, year: String?, price: String?, car_id: String?, dealer_id: String?, new_used: String?, mileage: String?, colour: String?, transmission: String?, body_type: String?, condition: String?, vin_number: String?, mm_code_id: String?, range: String?, fuel_type: String?, frontView: UIImage?, sideView: UIImage?, otherSideView: UIImage?){
        self.make = make
        self.model = model
        self.year = year
        self.price = price
        self.car_id = car_id
        self.dealer_id = dealer_id
        self.new_used = new_used
        self.mileage = mileage
        self.colour = colour
        self.transmission = transmission
        self.body_type = body_type
        self.condition = condition
        self.vin_number = vin_number
        self.mm_code_id = mm_code_id
        self.range = range
        self.fuel_type = fuel_type
        self.frontView = frontView
        self.sideView = sideView
        self.otherSideView = otherSideView
    
    }
    
}
