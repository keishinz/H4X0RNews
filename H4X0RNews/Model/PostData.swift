//
//  PostData.swift
//  H4X0RNews
//
//  Created by Keishin CHOU on 2019/12/22.
//  Copyright © 2019 Keishin CHOU. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post:Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
