//
//  ViewController.swift
//  Lesson4
//
//  Created by 呂麗莎 on 2019/11/17.
//  Copyright © 2019 呂麗莎. All rights reserved.
//
//按字母排序
import Alamofire
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    //给变量加监视器
    var articles: [Article]?{
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestNews()
    }
    
    private func requestNews() {
        let url = "https://newsapi.org/v2/top-headlines"
        
        let parameters: Parameters = [
            "country": "us",
            "apiKey":"a32fccf9076e41b1ae21b28e40e749fc",
        ]
        
        Alamofire.request(url,
                          method: .get,
                          parameters: parameters)
            .responseData { responseData in
                //print(data)
                let decoder = JSONDecoder()
                //可能存在可能不存在 if let 变量名 =
                //存在的时候 else 不存在的时候
                if let data = responseData.data {
                    do {
                        //decode可能失败 因为data格式不一定输入正确
                        //.self=.class
                        let result = try decoder.decode(NewsResponse.self, from: data)
                        
                        
                        //print(result.articles.count)
                        self.articles = result.articles
                    } catch {
                        
                    }
                } else {
                    //不存在的时候的处理方式
                    print("response failed")
                }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let articles = self.articles {
            return articles.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.newsTitle.text = self.articles![indexPath.row].title
        cell.newsContent.text = self.articles![indexPath.row].description
        
        if let img = self.articles![indexPath.row].urlToImage{
            if let imageUrl = URL(string: img){
                Alamofire.request(imageUrl,
                                  method: .get)
                    .responseData { imageData in
                        if let image = imageData.result.value {
                            //print("aaaaaaaaaaaa: \(image)")
                            cell.newsImg.image = UIImage(data: image, scale:1)
                        }
                }
            }
        }else{
            
        }
        
        
        //let imageUrl = URL(string: self.articles![indexPath.row].urlToImage!)
        //let urlString = self.articles![indexPath.row].urlToImage
        //let url = URL(urlString)
        
//        if let imageUrl = URL(string: self.articles![indexPath.row].urlToImage!) {
//            Alamofire.request(imageUrl,
//                              method: .get)
//                .responseData { imageData in
//                    if let image = imageData.result.value {
//                        //print("image downloaded: \(image)")
//                        cell.newsImg.image = UIImage(data: image, scale:1)
//                    }
//
//            }
//        }
        
        
        
        //        if let imageUrl = URL(string: self.articles![indexPath.row].urlToImage!) {
        //            Alamofire.request(imageUrl,
        //                method: .get).responseData{ data in
        //                    cell.newsImg.image = UIImage(data: data, scale:1)
        //                }
        //            }
        //        Alamofire.request(url, method: .get).response { (request, response, data, error) in
        //cell.newsImg.image = UIImage(data: , scale:1)
        //          }
        //        if let urlToImage = self.articles![indexPath.row].urlToImage
        //            let url = URL(string: urlToImage) {
        //            cell.newsImg.af_setImage(withURL: url,
        //                                         placeholderImage: #imageLiteral(resourceName: "placeholder"))
        //        } else {
        //            cell.myImageView.image = nil
        //        }
        
        //        DataRequest.addAcceptableImageContentTypes(["image/jpg"])
        //        Alamofire.request("").responseImage { response in
        //            debugPrint(response)
        //
        //            print(response.request)
        //            print(response.response)
        //            debugPrint(response.result)
        //
        //            if let image = response.result.value {
        //                print("image downloaded: \(image)")
        //            }
        //        }
        
        
        
        return cell
    }
    
}
