//
//  CrawlingText.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 27.09.23.
//

import SwiftUI

struct CrawlingText: View {
    
    // MARK: - Properties
    
    @State private var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    @State private var counter: Int = 0
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    // MARK: - Body
    var body: some View {
        
        HStack(spacing: 0.0) {
            ForEach(loadingText.indices, id: \.self) { index in
                Text(loadingText[index])
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .offset(y: counter == index ? -9 : 0)
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                } else {
                    counter += 1
                }
            }
        }
        
    } // body
}



#Preview {
    CrawlingText()
}
