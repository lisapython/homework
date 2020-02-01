//
//  TransController.swift
//  homework5
//
//  Created by 呂麗莎 on 2019/11/30.
//  Copyright © 2019 呂麗莎. All rights reserved.
//

import Alamofire
import UIKit

class TransController: UIViewController {
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    
    @IBOutlet weak var output1: UITextField!
    @IBOutlet weak var output2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func transToEn() {
        translator("EN")
    }
    
    @IBAction func transToCh(_ sender: Any) {
        translator("CH")
    }
    
    func translator(_ language: String) {
        let url = "https://aidemo.youdao.com/trans"
        
        let inputContents = ""
        var inputLang = ""
        var outputLang = ""
        //var outputContents = ""
        
        //判断应该走到哪个画面
        if language == "EN" {
            if inputContents == input1.text! {
                inputLang = "zh-CHS"
                outputLang = "en"
            }
        } else if language == "CH"{
            if inputContents == input2.text! {
                inputLang = "en"
                outputLang = "zh-CHS"
            }
            
        } else {
            print("nonono")
        }
        
        let parameters = [
            "q": inputContents,
            "from": inputLang,
            "to": outputLang,
        ]
        
        Alamofire.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: .default).response { response in
            debugPrint(response)
        }

    }
    
}
