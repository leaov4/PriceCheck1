//
//  File.swift
//  PriceCheck1
//
//  Created by Lea Overend on 6/26/17.
//  Copyright © 2017 loverend. All rights reserved.
//

import AVFoundation
import UIKit

class CameraVC : NSObject  {

    var captureSession: AVCaptureSession?
    var frontCamera: AVCaptureDevice?
    var backCamera: AVCaptureDevice?
    
    var currentCameraPosition: CameraPosition?
    var frontCameraInput: AVCaptureDeviceInput?
    var backCameraInput: AVCaptureDeviceInput?
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    var photoOutput: AVCapturePhotoOutput?
    
    func prepare(completionHandler: @escaping (Error?) -> Void) {
    
        func createCaptureSession() {
            self.captureSession = AVCaptureSession()
        }
    
    
        func configureCaptureDevices() throws {
        
            let session = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified)
        
            guard let cameras = (session?.devices.flatMap { $0 }), !cameras.isEmpty else { throw CameraControllerError.noCamerasAvailable }

        
            for camera in cameras {
                if camera.position == .front {
                    self.frontCamera = camera
                }
        
                if camera.position == .back {
                    self.backCamera = camera
            
                    try camera.lockForConfiguration()
                    camera.focusMode = .continuousAutoFocus
                    camera.unlockForConfiguration()
                }
            }
        }
    
        func configureDeviceInputs() throws {
            
            guard let captureSession = self.captureSession else { throw CameraControllerError.captureSessionIsMissing }

            if let backCamera = self.backCamera {
                self.backCameraInput = try AVCaptureDeviceInput(device: backCamera)
                
                if captureSession.canAddInput(self.backCameraInput!) { captureSession.addInput(self.backCameraInput!) }
                
                self.currentCameraPosition = .back
            }
                
            else if let frontCamera = self.frontCamera {
                self.frontCameraInput = try AVCaptureDeviceInput(device: frontCamera)
                
                if captureSession.canAddInput(self.frontCameraInput!) { captureSession.addInput(self.frontCameraInput!) }
                else { throw CameraControllerError.inputsAreInvalid }
                
                self.currentCameraPosition = .front
            }
                
            else { throw CameraControllerError.noCamerasAvailable }
            
        }
        func configurePhotoOutput() throws {
            guard let captureSession = self.captureSession else { throw CameraControllerError.captureSessionIsMissing }
            
            self.photoOutput = AVCapturePhotoOutput()
            self.photoOutput!.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecJPEG])], completionHandler: nil)
            
            if captureSession.canAddOutput(self.photoOutput) { captureSession.addOutput(self.photoOutput) }
            captureSession.startRunning()

        }
    
        DispatchQueue(label: "prepare").async {
            do {
                createCaptureSession()
                try configureCaptureDevices()
                try configureDeviceInputs()
                try configurePhotoOutput()
            }
    
            catch {
                DispatchQueue.main.async {
                completionHandler(error)
                }
    
                return
            }
    
            DispatchQueue.main.async {
                completionHandler(nil)
            }
        }
    }
    
    func displayPreview(on view: UIView) throws {
        
        guard let captureSession = self.captureSession, captureSession.isRunning else { throw CameraControllerError.captureSessionIsMissing }
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.previewLayer?.connection?.videoOrientation = .portrait
        
        view.layer.insertSublayer(self.previewLayer!, at: 0)
        self.previewLayer?.frame = view.frame
    }
    

public enum CameraPosition {
    case front
    case back
}

enum CameraControllerError: Swift.Error {
        case captureSessionAlreadyRunning
        case captureSessionIsMissing
        case inputsAreInvalid
        case invalidOperation
        case noCamerasAvailable
        case unknown
    }
}
