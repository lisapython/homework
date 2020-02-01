//
//  DataModel.swift
//  homework5
//
//  Created by 呂麗莎 on 2019/12/01.
//  Copyright © 2019 呂麗莎. All rights reserved.
//

import Foundation

struct TransRequest: Codable {
    let q: String
    let from: String?
    let to: String
}

struct TransRequest: Codable {
    let name: String
}
