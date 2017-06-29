//
//  SettingsViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/29/17.
//  Copyright © 2017 loverend. All rights reserved.
//

//  textField.placeholder = nameOfMyString

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var dealershipNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        nameTextField.text = "test"
        codeTextField.text = "test2"
        dealershipNameTextField.text = "test3"
        addressTextField.text = "test4"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    
        if let nameValue = defaults.string(forKey: defaultsKeys.keyName){
            nameTextField.text = nameValue
        }
        
        if let codeValue = defaults.string(forKey: defaultsKeys.keyCode){
            codeTextField.text = codeValue
        }
      
        if let dealershipNameValue = defaults.string(forKey: defaultsKeys.keyDealershipName){
            dealershipNameTextField.text = dealershipNameValue
        }

        if let addressValue = defaults.string(forKey: defaultsKeys.keyAddress){
            addressTextField.text = addressValue
        }

 
        
    }

    @IBAction func updateName(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.setValue(nameTextField.text, forKey: defaultsKeys.keyName)
        
        defaults.setValue(codeTextField.text, forKey: defaultsKeys.keyCode)
     
        defaults.setValue(dealershipNameTextField.text, forKey: defaultsKeys.keyDealershipName)
        
        defaults.setValue(addressTextField.text, forKey: defaultsKeys.keyAddress)
        
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
