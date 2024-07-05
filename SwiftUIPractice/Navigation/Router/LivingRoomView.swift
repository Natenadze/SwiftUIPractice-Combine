//
//  LivingRoomView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

struct LivingRoomView: View {
 
    var id = 1
    var router: Router
    
    var body: some View {
        VStack {
            Image(systemName: "sofa.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            
            Text("Livingroom")
                .font(.system(size: 24))
                .padding(.top, 12)
            
            Button("Go to Jane's Bedroom") {
                router.navigate(to: .bedroom(owner: "Jane", color: .pink))
            }
            .padding(.top, 12)
            
            Button("Go to John's Bedroom") {
                router.navigate(to: .bedroom(owner: "John", color: .gray))
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
    
}


extension LivingRoomView: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: LivingRoomView, rhs: LivingRoomView) -> Bool {
        lhs.id == rhs.id
    }
}
