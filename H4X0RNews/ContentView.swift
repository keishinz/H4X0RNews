//
//  ContentView.swift
//  H4X0RNews
//
//  Created by Keishin CHOU on 2019/12/22.
//  Copyright © 2019 Keishin CHOU. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
//            List {
//                Text("Hello, World!")
//                Text("aaa")
//            }
            List(networkManager.posts, rowContent: { (post) in
                HStack {
                    Image(systemName: "camera")
                        .foregroundColor(.blue)
                    Text(String(post.points))
                        .frame(width: 38)
                    Text(post.title)
                    .lineLimit(2)
                }
            })
            .navigationBarTitle("Title")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

//struct Post: Identifiable {
//    let id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1", title: "aaa"),
//    Post(id: "2", title: "bbb"),
//    Post(id: "3", title: "ccc")
//]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
