//
//  Transition.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 25.09.23.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

struct Transition: View {
    
    @State private var isTransitioning = false
    
    var body: some View {
        
        Spacer()
        
        if isTransitioning {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 250, height: 300)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.red)
//                .transition(.move(edge: .leading))
//                .transition(AnyTransition.scale.animation(.easeIn))
                .transition(.rotateOn)
//                .transition(.roating(rotation: 500))
        }
        
        Spacer()
        
        
        Button(action: {
            withAnimation(.easeInOut) {
                isTransitioning.toggle()
            }
        }, label: {
            Text("Button")
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color.blue)
                .font(.title)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
//                .onTapGesture {
//                    isTransitioning.toggle()
//                }
        })
    }
}


// MARK: - Extension

extension AnyTransition {
    
    static var rotating: AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: 280),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static func roating(rotation: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        return AnyTransition.asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading)
        )
    }
}



// MARK: - Preview

#Preview {
    Transition()
}
