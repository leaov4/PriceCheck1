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

    
    @IBOutlet fileprivate var captureButton: UIButton!
    @IBOutlet fileprivate var photoModeButton: UIButton!
    
    override var prefersStatusBarHidden: Bool { return true }
    
    //@IBOutlet weak var myImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        /*
        func configureCameraController() {
            cameraVC.prepare {(error) in
                if let error = error {
                    print(error)
                }
                
                try? self.cameraVC.displayPreview(on: self.capturePreviewView)
            }
        }
        */
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cam(_ sender: UIButton) {
    /*
        let imageUrl:URL = URL(string: imageUrlString)!
        
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
        imageView.center = self.view.center
        
        let image = UIImage(data: imageData as Data)
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
      */
        //let image = UIImage(named: carImage)
        //let imageView = UIImageView (named: image!)
        
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.allowsEditing = false
            imagePicker.modalPresentationStyle = .fullScreen
      //      imagePicker.cameraOverlayView = imageView
            present(imagePicker, animated: true, completion: nil)
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
