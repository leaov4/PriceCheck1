//
//  PriceCheckCarDetailViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit

class PriceCheckCarDetailViewController: UIViewController {

    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var vinNumberLabel: UILabel!
    @IBOutlet weak var mmCodeLabel: UILabel!
    @IBOutlet weak var dealerIdLabel: UILabel!
    @IBOutlet weak var newUsedLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var fuelTypeLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var colourLabel: UILabel!
    @IBOutlet weak var bodyTypeLabel: UILabel!
    @IBOutlet weak var carIdLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var sideImage: UIImageView!
    @IBOutlet weak var otherSideImage: UIImageView!
   
    var car: PriceCheckCar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        makeLabel.text = car?.make
        modelLabel.text = car?.model
        yearLabel.text = car?.year
        priceLabel.text = car?.price
        rangeLabel.text = car?.range
        vinNumberLabel.text = car?.vin_number
        mmCodeLabel.text = car?.mm_code_id
        dealerIdLabel.text = car?.dealer_id
        newUsedLabel.text = car?.new_used
        mileageLabel.text = car?.mileage
        fuelTypeLabel.text = car?.fuel_type
        transmissionLabel.text = car?.transmission
        colourLabel.text = car?.colour
        bodyTypeLabel.text = car?.body_type
        carIdLabel.text = car?.car_id
        conditionLabel.text = car?.condition
        
    
        
        if car?.frontView != nil {
            frontImage.image = (car?.frontView)!
        } else{
            frontImage.image = #imageLiteral(resourceName: "car-outline-clipart-4")
        }
        
        if car?.sideView != nil {
            sideImage.image = (car?.sideView)!
        } else{
            sideImage.image = #imageLiteral(resourceName: "car-outline-clipart-4")
        }

        if car?.otherSideView != nil {
            otherSideImage.image = (car?.otherSideView)!
        } else{
            otherSideImage.image = #imageLiteral(resourceName: "car-outline-clipart-4")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
