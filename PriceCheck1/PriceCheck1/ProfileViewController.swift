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
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        let name = defaults.string(forKey: defaultsKeys.keyName)
        nameLabel.text = " Name: \(name!) "
        
        let code = defaults.string(forKey: defaultsKeys.keyCode)
        dealershipCodeLabel.text = "Dealership Code: \(code!)"
        
      
        let dealershipName1 = defaults.string(forKey: defaultsKeys.keyDealershipName)
        dealershipNameLabel.text = "Dealership Name: \(dealershipName1!)"
       
        
        let address1 = defaults.string(forKey: defaultsKeys.keyAddress)
        addressLabel.text = "Address: \(address1!)"
       
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
