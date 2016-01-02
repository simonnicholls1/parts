//
//  View2.swift
//  parts
//
//  Created by Simon on 01/01/2016.
//  Copyright (c) 2016 Simon. All rights reserved.
//

import UIKit
import AVFoundation

class View2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var cameraView: UIView!
    
    var captureSession : AVCaptureSession?
    
    var stillImageOutput :AVCaptureStillImageOutput?
    
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        var error : NSError?
        
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil)
        {
            captureSession?.addInput(input)
        }
        
        stillImageOutput = AVCaptureStillImageOutput()
        
        stillImageOutput?.outputSettings = [AVVideoCodecKey :AVVideoCodecJPEG]
        
        if (captureSession?.canAddOutput(stillImageOutput) != nil)
        {
            captureSession?.addOutput(stillImageOutput)
            previewLayer = AVCaptureVideoPreviewLayer(session : captureSession)
            
            previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
            
            previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
            
            cameraView.layer.addSublayer(previewLayer!)
            
            captureSession?.startRunning()
            
        }
        
    }

}
