//
//  RoomDetailView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 01.06.24.
//

import SwiftUI

struct RoomDetail: View {
    
    let roomInfo: RoomInfo
  
    var body: some View {
        VStack {
            roomInfo.image
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            
            Text(roomInfo.name)
                .font(.system(size: 24))
        }
        .padding()
    }
}
