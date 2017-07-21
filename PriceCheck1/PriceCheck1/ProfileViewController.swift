//
//  ProfileViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/28/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dealershipCodeLabel: UILabel!
    @IBOutlet weak var dealershipNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = "Name"
        dealershipCodeLabel.text = "Dealership Code"
        dealershipNameLabel.text = "Dealership Name"
        addressLabel.text = "Location"
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        let name = defaults.string(forKey: defaultsKeys.keyName)
        if name == nil {
            nameLabel.text = "Name"
        } else {
        nameLabel.text = "Name: \(name!) "
        }
        
        let code = defaults.string(forKey: defaultsKeys.keyCode)
        dealershipCodeLabel.text = "Dealership Code: \(code!)"
        
    
        let dealershipName1 = defaults.string(forKey: defaultsKeys.keyDealershipName)
        if dealershipName1 == nil {
            dealershipNameLabel.text = "Dealership Name"
        } else {
        dealershipNameLabel.text = "Dealership Name: \(dealershipName1!)"
       
        }
        
        let address1 = defaults.string(forKey: defaultsKeys.keyAddress)
        if address1 == nil {
            addressLabel.text = "Location"
        } else {
        addressLabel.text = "Address: \(address1!)"
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
