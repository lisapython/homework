//
//  ViewController.swift
//  Task02-1
//
//  Created by 呂麗莎 on 2019/11/04.
//  Copyright © 2019 呂麗莎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressed(_ sender: UIButton) {
        //print(sender.titleLabel!.text!)
        showNumBotton(inputNum : sender.titleLabel!.text!)
    }
    
    @IBAction func equals() {
        //let siki = showNumber.text
        let text = String(showNumber.text!)
        let kekka = text.components(separatedBy: " ")
        let result: Int
        if(kekka[1] == "+"){
            result = Int(kekka[0])! + Int(kekka[2])!
        }else if(kekka[1] == "-"){
            result = Int(kekka[0])! - Int(kekka[2])!
        }else if(kekka[1] == "*"){
            result = Int(kekka[0])! * Int(kekka[2])!
        }else{
            result = Int(kekka[0])! / Int(kekka[2])!
        }
        
        showNumber.text = String(result)
    }
    
    @IBAction func clear(_ sender: Any) {
        showNumber.text = ""
    }
    
    func showNumBotton(inputNum : String) {
        showNumber.text = showNumber.text! + inputNum
    }
}

