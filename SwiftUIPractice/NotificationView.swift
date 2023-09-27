//
//  NotificationView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 21.09.23.
//


import SwiftUI

struct NotificationView: View {
    
    var body: some View {
        
        Image(systemName: "heart.fill")
            .font(.system(size: 60))
            .foregroundStyle(.pink)
            .background(
            Circle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.purple]),
                                   startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                                   endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                )
                .frame(width: 200, height: 200)
                .shadow(color: .purple, radius: 20, x: 0.0, y: 9)
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.blue)
                        .overlay {
                            Text("5")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                        .padding([.bottom, .trailing], 15)
                        .shadow(color: .purple, radius: 10, x: 2, y: 3)
                }
                
            )
            
            
    }
    
}

#Preview {
    NotificationView()
}
