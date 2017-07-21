//
//  AddPriceCheckCarViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit

var imageView: UIImageView?
var imageViewLandscape: UIImageView?
var imageViewRight: UIImageView?
var imagesArray = [UIImage!]()
var stop = 0;
class AddPriceCheckCarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var counter = 0
    
    open var allowsRotate = true
    
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    let imageUrlStringSide = "http://www.clker.com/cliparts/Z/N/q/a/3/l/old-car-outline-hi.png"
    let imageUrlStringFront = "http://images.clipartpanda.com/vehicle-clip-art-faceman_Suburban_Assault_Vehicle_(Front).png"
    let imageUrlStringOtherSide = "http://www.clker.com/cliparts/6/3/d/4/11954231691370781588faceman_Suburban_Assault_Vehicle_(Side).svg.hi.png"
    
    var fake = #imageLiteral(resourceName: "car-outline-clipart-4")
    
    let imagePicker = UIImagePickerController()
    
    var delegate: AddPriceCheckCarDelegate?
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        defer {
            print ("picker about to be dismissed")
            picker.dismiss(animated: true)
            if(stop == 0){
                Camera(myString: imageUrlStringOtherSide)
            }
            if(stop == 1){
              //  Camera(myString: imageUrlStringSide)
            }
            
            stop = stop + 1;
            print ("picker dismissed")
        }
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        counter += 1
        
        if (counter<4) {
            imagesArray.append(image)
            print ("appended")
                    }
        print("called")
        print(image)
       
    }
    
    @IBAction func sideCamera(_ sender: UIButton){
        Camera(myString: imageUrlStringSide)
    }
   
    
    @IBAction func frontCamera(_ sender: UIButton) {
        Camera(myString: imageUrlStringFront)
    }
    
    @IBAction func otherSideCamera(_ sender: UIButton){
        Camera(myString: imageUrlStringOtherSide)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        imagePicker.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
     
        NotificationCenter.default.addObserver(self, selector: #selector(AddPriceCheckCarViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Camera( myString: String)  {
        print ("Start of Camera Func")
        //overlay image
        let imageUrl:URL = URL(string: myString)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        
        imageViewRight = UIImageView(frame: CGRect(x:10, y:100, width: 300, height:300))
        
        let image = UIImage(data: imageData as Data)
        let newImageLandscape = UIImage(cgImage: (image?.cgImage!)!, scale: CGFloat(3.0), orientation: .left)
        let newImageRight = UIImage(cgImage: (image?.cgImage!)!, scale: CGFloat(1.5), orientation: .up)
        imageViewLandscape = UIImageView(frame: CGRect(x:10, y:60, width:300, height:400))
        
        imageViewLandscape?.contentMode = UIViewContentMode.scaleAspectFit
        imageViewRight?.contentMode = UIViewContentMode.scaleAspectFit
        
        imageViewLandscape?.image = newImageLandscape
        imageViewRight?.image = newImageRight
        
        //camera functions
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.cameraCaptureMode = .photo
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .fullScreen
        
        print("About to Present")
        present(imagePicker, animated: true, completion: nil)
        print ("Presented")
        
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
            
            delegate?.willSavePriceCheckCar()
            
            if (imagesArray.count == 0){
                for _ in 1...3{
                    imagesArray.append(fake)
                }
            }
            
            let newPriceCheckCar = PriceCheckCar(make: makeTextField.text, model: modelTextField.text, year: yearTextField.text, price: priceTextField.text, car_id: "l", dealer_id: "e", new_used: "a", mileage: "o", colour: "v", transmission: "e", body_type: "r", condition: "e", vin_number: "n", mm_code_id: "d", range: "x", fuel_type: "x", frontView: imagesArray[0], sideView: imagesArray[1], otherSideView: imagesArray[2])
            
            delegate?.didSavePriceCheckCar(car: newPriceCheckCar!)
            
            cars.append(newPriceCheckCar!)
            
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    @IBAction func cancel(_ sender: Any){
        
        delegate?.didCancel()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func rotated() {
        
       if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            print("Landscape")
            imagePicker.cameraOverlayView = imageViewLandscape
       }
    
       if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            print("Portrait")
            imagePicker.cameraOverlayView = imageViewRight
        }
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

