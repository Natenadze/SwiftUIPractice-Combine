//
//  SnowingAnimation.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 25.09.23.
//

import SwiftUI

struct SnowingAnimation: View {
    
    var body: some View {
        ZStack {
            Rain(character: "❄️")
            Text("Hello, World!")
        }
        
    }
    
}

#Preview {
    SnowingAnimation()
}


// MARK: -

struct Rain: View {
    
    // MARK: - Properties
    private let character: Character
    private let direction: Direction
    
    // MARK: - Init
    init(character: Character, direction: Direction = .top) {
        self.character = character
        self.direction = direction
    }
    
    // MARK: - Body
    var body: some View {
        ForEach(0..<25, id: \.self) {
            Drop(character: character, 
                 direction: direction,
                 number: $0)
        }
    }
    
}

private extension Rain {
    
    struct Drop: View {
        
        // MARK: - Properties
        let character: Character
        let direction: Direction
        let number: Int
        
        @State private var isAnimation: Bool = false
        
        // MARK: - Body
        var body: some View {
            Text(String(character))
                .font(
                    .system(
                        size: isAnimation
                        ? .random(in: 30...50)
                        : .random(in: 30...50)
                    )
                )
                .fixedSize()
                .opacity(
                    isAnimation
                    ? direction == .top ? -0.5 : 1
                    : direction == .top ? 2 : 1
                )
                .padding(
                    number.isMultiple(of: 2) ? .leading : .trailing,
                    .random(in: 0...360)
                )
                .offset(y: isAnimation
                        ? direction == .top ? 500 : -510
                        : direction == .top ? -510 : 500
                )
                .onAppear {
                    withAnimation(
                        .linear(duration: .random(in: 12...14))
                        .delay(Double(number))
                        .repeatForever(autoreverses: false)
                    ) {
                        isAnimation = true
                    }
                }
        }
    }
    
}

extension Rain {
    enum Direction {
        case top
        case bottom
    }
}

