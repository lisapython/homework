//
//  DataModel.swift
//  Lesson4
//
//  Created by 呂麗莎 on 2019/11/17.
//  Copyright © 2019 呂麗莎. All rights reserved.
//

import Foundation

//swift里struct相当于java里面的class
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    //[]是说一个数组，在json里面定义也是一个[]
    let articles: [Article]
}

//实现Codable接口
struct Article: Codable {
    let source: ArticleSource
    //带问号是表示可能为空 nil只能付值给String？
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

struct ArticleSource: Codable {
    let name: String
}
