//
//  LoginViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/28/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var dealerCode: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        defaults.set(dealerCode.text, forKey : "DealerCode")
        
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
