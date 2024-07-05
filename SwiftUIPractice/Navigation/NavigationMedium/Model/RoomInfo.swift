//
//  RoomInfo.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 01.06.24.
//

import SwiftUI

struct RoomInfo: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let image: Image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
