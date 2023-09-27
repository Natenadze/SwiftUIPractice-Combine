//
//  DownloadJSONwithCombine.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 22.09.23.
//

import SwiftUI
import Combine

// MARK: - Download JSON from API in Swift with Combine
// MARK: - https://www.youtube.com/watch?v=fdxFp5vU6MQ&list=PLwvDm4VfkdpiagxAXCT33Rkwnc5IVhTar&index=24&ab_channel=SwiftfulThinking




struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineVM()
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
    
}
