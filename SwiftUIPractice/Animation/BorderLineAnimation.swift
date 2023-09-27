//
//  BorderLineAnimation.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 25.09.23.
//

import SwiftUI

struct BorderLine: View {
    
    
    var body: some View {
        VStack(spacing: 50) {
            AnimationBorder {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                    .frame(width: 300, height: 100)
            }
            
            AnimationBorder(
                lineWidth: 10,
                cornerRadius: 200,
                colors: [.green, .cyan, .blue]
            ) {
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 150, height: 150)
            }
            
            AnimationBorder(
                cornerRadius: 200,
                speed: 2,
                colors: [.pink, .purple, .indigo]
            ) {
                Capsule(style: .circular)
                    .foregroundColor(.black)
                    .frame(width: 300, height: 100)
            }
            
            Button(action: {}) {
                AnimationBorder(
                    lineWidth: 3,
                    speed: 0.75
                ) {
                    Text("Animate mate")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 75)
                }
            }
        }
        .navigationTitle("AnimationBorder")
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        BorderLine()
            .preferredColorScheme(.dark)
    }
}



// MARK: - Helper Struct

struct AnimationBorder<Content>: View where Content: View {
    
    private let lineWidth: CGFloat
    private let cornerRadius: CGFloat
    private let speed: Double
    private let colors: [Color]
    private let content: () -> Content
    @State private var rotation: CGFloat = 0
    @State private var size: CGSize = .init(width: 500, height: 500)
    
    private var hypotenuses: CGFloat {
        sqrt(pow(size.width, 2) + pow(size.height, 2))
    }
    
    // MARK: - Init
    
    init(
        lineWidth: CGFloat = 4,
        cornerRadius: CGFloat = 20,
        speed: Double = 3,
        colors: [Color] = [.red, .yellow, .green, .blue, .purple],
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.lineWidth = lineWidth
        self.cornerRadius = cornerRadius
        self.speed = speed
        self.colors = colors
        self.content = content
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            content()
                .background(
                    GeometryReader {
                        Color.clear.preference(key: SizePreferenceKey.self, value: $0.size)
                    }
                )
            
            RoundedRectangle(cornerSize: .zero)
                .frame(width: hypotenuses, height: hypotenuses)
                .foregroundStyle(
                    LinearGradient(
                        gradient: .init(colors: colors),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: lineWidth)
                        .frame(
                            width: size.width - lineWidth / 2,
                            height: size.height - lineWidth / 2
                        )
                }
        }
        .frame(width: size.width, height: size.height)
        .onAppear {
            withAnimation(
                .linear(duration: speed)
                .repeatForever(autoreverses: false)
            ) {
                rotation = 360
            }
        }
        .onPreferenceChange(SizePreferenceKey.self) { size = $0 }
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}



