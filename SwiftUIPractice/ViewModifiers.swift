//
//  ViewModifiers.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 10.04.24.
//

// https://blorenzop.medium.com/routing-navigation-in-swiftui-f1f8ff818937

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 200)
            .font(.title2)
            .foregroundStyle(.white)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension View {
    func withCustomButtonModifier(color: Color = .blue) -> some View {
        modifier(CustomButtonModifier(color: color))
    }
    
}

struct ViewModifiers: View {
    
    var body: some View {
        Button("Start") {
            print("start pressed")
        }
        .modifier(CustomButtonModifier(color: .orange))
        
        Button("Finish") {
            print("FINISH pressed")
        }
        .withCustomButtonModifier(color: .red)
    }
}


#Preview {
    ViewModifiers()
}
