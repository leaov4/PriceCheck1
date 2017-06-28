//
//  SideViewController.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/27/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import UIKit

class SideViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    let imageUrlString = "http://www.clker.com/cliparts/Z/N/q/a/3/l/old-car-outline-hi.png"
    let imageUrlStringFront = "http://images.clipartpanda.com/vehicle-clip-art-faceman_Suburban_Assault_Vehicle_(Front).png"
    //let imageUrlString = "http://icon-icons.com/icons2/38/PNG/512/cartransport_coch_4981.png"
    
    override var prefersStatusBarHidden: Bool { return true }
    
    let imagePicker = UIImagePickerController()
    let imagePicker2 = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        //imagePicker2.delegate = self
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sideCamera(_ sender: UIButton){
        
        let imageUrl:URL = URL(string: imageUrlString)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        let imageView = UIImageView(frame: CGRect(x:10, y:100, width:300, height:300))
        let image = UIImage(data: imageData as Data)
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.allowsEditing = false
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.cameraOverlayView = imageView
            present(imagePicker, animated: true, completion: nil)
    }
   
    @IBAction func frontCam(_ sender: UIButton) {

        let imageUrl:URL = URL(string: imageUrlStringFront)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        let imageView = UIImageView(frame: CGRect(x:10, y:100, width:300, height:300))
        let image = UIImage(data: imageData as Data)
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        imagePicker2.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker2.cameraCaptureMode = .photo
        imagePicker2.allowsEditing = false
        imagePicker2.modalPresentationStyle = .fullScreen
        imagePicker2.cameraOverlayView = imageView
        present(imagePicker2, animated: true, completion: nil)
        
    }
    
    private func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
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
