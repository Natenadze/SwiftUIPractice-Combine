//
//  LivingroomView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

struct LivingroomView: View, Hashable {
 
    var id = 1
    var router: Router
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(systemName: "sofa.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            
            Text("Livingroom")
                .font(.system(size: 24))
                .padding(.top, 12)
            
            Button("Go to Jane's Bedroom") {
                router.navigate(to: .bedroom(owner: "Jane"))
            }
            .padding(.top, 12)
            
            Button("Go to John's Bedroom") {
                router.navigate(to: .bedroom(owner: "John"))
            }
            .padding(.top, 12)
            
            Button {
                router.navigateBack()
            } label: {
                Text("Back")
            }
            .padding(.top, 4)
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
    
    func hash(into hasher: inout Hasher) {
        // Use any properties that uniquely identify your view for hashing
        // In this example, I'm using the router property as an identifier
        hasher.combine(id)
    }
    
    static func == (lhs: LivingroomView, rhs: LivingroomView) -> Bool {
        lhs.id == rhs.id
    }
    
}
