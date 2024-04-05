//
//  MiddleFingerPopUp.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 24.12.23.
//

import SwiftUI

struct MiddleFinger: View {
    
    @State private var popIn = false
    
    var body: some View {
        Image("finger")
//        .offset(x: popIn ? 0 : 250) // From right
//        .offset(x: popIn ? 0 : -250) // From left
//        .offset(y: popIn ? 0 : -1000) // From top
            .offset(y: popIn ? 0 : 1000) // From bottom
            .scaleEffect(popIn ? 1.3 : 0)
            .animation(
                .easeInOut(duration: 2)
                .delay(1)
                .repeatForever(autoreverses: false),
                value: popIn
            )
            .onAppear {
                popIn.toggle()
            }
        
    }
}


#Preview {
    MiddleFinger()
}

