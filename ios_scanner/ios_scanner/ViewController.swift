//
//  ViewController.swift
//  ios_scanner
//
//  Created by 呂麗莎 on 2020/01/11.
//  Copyright © 2020 呂麗莎. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBAction func clickToShow(_ sender: Any) {
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if !metadataObjects.isEmpty
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                    let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: UIAlertController.Style.alert)
                    
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //AVCaptureSession是管理从设备上进出的数据的类
        let captureSession = AVCaptureSession()

        //定义打开相机
        let videoDevice = AVCaptureDevice.default(for: .video)!
        do {
            let input = try AVCaptureDeviceInput(device: videoDevice)
            captureSession.addInput(input)
        } catch {
            print("读入内容有问题")
        }

        let output = AVCaptureMetadataOutput()
        captureSession.addOutput(output)
        output.setMetadataObjectsDelegate(self as AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
        //设定读取内容为QRkCode
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        let video = AVCaptureVideoPreviewLayer(session: captureSession)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)

        captureSession.startRunning()
        
    }


}

