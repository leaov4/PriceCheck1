//
//  AddPriceCheckCarViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit

class AddPriceCheckCarViewController: UIViewController {

    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
     
    
    var delegate: AddPriceCheckCarDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: AnyObject){
        
        if (makeTextField.text?.isEmpty)! {
            // Throw an error
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            
            let alertController = UIAlertController(title: "Error", message: "Please enter some text", preferredStyle: .alert)
            
            //now we are adding the default action to our alertcontroller
            alertController.addAction(defaultAction)
            
            //and finally presenting our alert using this method
            self.present(alertController, animated: true, completion: nil)
        } else {
            
            // Save PriceCheckCar to a database or server...
            
            delegate?.willSavePriceCheckCar()
            
            let newPriceCheckCar = PriceCheckCar(make: makeTextField.text, model: modelTextField.text, year: yearTextField.text, price: priceTextField.text)
            
          //  MyCarsTableViewController?.carWasSaved(car: newPriceCheckCar!)
            
            delegate?.didSavePriceCheckCar(car: newPriceCheckCar!)
            
            cars.append(newPriceCheckCar!)
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancel(_ sender: Any){
        
        delegate?.didCancel()
        self.dismiss(animated: true, completion: nil)
        
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        print("test")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

