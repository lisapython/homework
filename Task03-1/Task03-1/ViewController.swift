//
//  ViewController.swift
//  Task03-1
//
//  Created by 呂麗莎 on 2019/11/13.
//  Copyright © 2019 呂麗莎. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var textField = ""
    
    var list = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func clickAdd(_ sender: Any) {
        //.alert弹出框 .actionsheet:从地下弹出来的框框
        let alert = UIAlertController(
            title: "添加",
            message:"一个新的任务",
            preferredStyle: .alert)
        
        //为弹出框添加输入框
        alert.addTextField { (UITextField) in}
        
        //OK action
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { (action) -> Void in
                //print("Ok button tapped")
                self.textField = alert.textFields![0].text!
                //print(self.textField)
                self.list.append(self.textField)
                self.tableView.reloadData()
        })
        
        // Cancel action
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: { (action) -> Void in
            //print("Cancel button tapped")
        })
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        //viewcontrollertopresent 放要弹出的东西 animated：动态效果？ completion:完成之后做的事情
        //？代表可以为空 其他类型不可以
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell01", for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell02", for: indexPath)
            //let cell = UITableViewCell(style:  , reuseIdentifier: "cell01")
            cell.textLabel?.text = list[indexPath.row - 1 ]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete {
            //print("aaaaaaaaaaa")
            //print(indexPath.row)
            self.list.remove(at: indexPath.row - 1 )
            tableView.reloadData()
        }
        
    }
    
    
}

