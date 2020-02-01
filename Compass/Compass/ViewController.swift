//
//  ViewController.swift
//  Compass
//
//  Created by 呂麗莎 on 2020/02/01.
//  Copyright © 2020 呂麗莎. All rights reserved.
//

import UIKit

import CoreLocation

class ViewController: UIViewController {
    
    // MARK:- 懒加载的属性
    private lazy var manager : CLLocationManager = CLLocationManager()
    
    // MARK:- 控件属性
    //var imageView : UIImageView = UIImageView()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLayoutSubviews() {
        //imageView.frame.size = CGSize(width: 300, height: 300)
        imageView.center = self.view.center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageView.image = UIImage(named: "compass")!
        
        self.view.addSubview(self.imageView)
        // 1.请求授权
        manager.requestWhenInUseAuthorization()
        // 2.设置代理
        manager.delegate = self
        // 3.请求手机头的方向
        manager.startUpdatingHeading()
    }
    
}


extension ViewController : CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        /*
         trueHeading : 真北方向
         magneticHeading : 磁北方向
         */
        // 1.获取真北方向
        let trueHeading = newHeading.trueHeading
        
        // 2.让指南针指向南面
        // 2.1.将真北方向的角度转成angle
        let angle = Double.pi / 180 * trueHeading
        
        // 2.2.创建transform
        let transform = CGAffineTransform(rotationAngle: CGFloat(-angle))
        
        // 2.3.进行旋转
        
        UIView.animate(withDuration: 0.5) {
            self.imageView.transform = transform
        }
        
         // Damping : 阻力系数 (0~1.0)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5.0, options: [], animations: {
         self.imageView.transform = transform
         }, completion: nil)
        
    }
}
