//
//  LoginViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/28/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit


struct defaultsKeys {
    static let keyCode = "Code"
    static let keyName = "Name"
    static let keyDealershipName = "DealershipName"
    static let keyAddress = "Address"
  
}

class LoginViewController: UIViewController {

    @IBOutlet weak var dealerCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        let defaults = UserDefaults.standard
        if let dealerCodeValue = defaults.string(forKey: defaultsKeys.keyCode){
            dealerCode.text = dealerCodeValue
        }
    }  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submit(_sender: UIButton) {
        
        let defaults = UserDefaults.standard
        defaults.setValue(dealerCode.text, forKey: defaultsKeys.keyCode)
        
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


