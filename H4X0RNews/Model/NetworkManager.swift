//
//  NetworkManager.swift
//  H4X0RNews
//
//  Created by Keishin CHOU on 2019/12/22.
//  Copyright © 2019 Keishin CHOU. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let decodeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: decodeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits                                
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
