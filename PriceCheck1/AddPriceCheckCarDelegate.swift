//
//  AddPriceCheckCarDelegate.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import Foundation
protocol AddPriceCheckCarDelegate {
    func didSavePriceCheckCar(car: PriceCheckCar)
    func willSavePriceCheckCar()
    func didCancel()
}
