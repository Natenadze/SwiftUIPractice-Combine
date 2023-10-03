//
//  MatchedGeometryEffect.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 03.10.23.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    
    let categories = ["First", "Second", "Third"]
    @Namespace private var namespace
    @State private var choosenCategory = ""
    
    // MARK: -
    var body: some View {
        HStack {
            
            ForEach(categories, id: \.self) { name in
                ZStack(alignment: .bottom) {
                    if choosenCategory == name {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 80, height: 4)
                            .matchedGeometryEffect(id: "ID", in: namespace)
                            .offset(y: 10)
                    }
                    
                    Text(name)
                }
                .font(.title2)
                .frame(maxWidth: .infinity)
                .foregroundStyle(choosenCategory == name ? .red : .black)
                .onTapGesture {
                    withAnimation {
                        choosenCategory = name
                    }
                }
            }
        }
        
    }
    
}


// MARK: - Preview
#Preview {
    MatchedGeometryEffect2()
}


struct MatchedGeometryEffect2: View {
    
    @Namespace private var namespace
    @State private var animate = false
    
    // MARK: - body
    var body: some View {
        VStack {
            if animate {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 200, height: 150)
                    .foregroundStyle(.red)
            }
            
            Spacer()
            
            if !animate {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 90, height: 90)
            }
        }
        .onTapGesture {
            withAnimation {
                animate.toggle()
            }
            
        }
    }
    
}

