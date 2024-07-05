//
//  PaintsInfo.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 01.06.24.
//

import SwiftUI

struct PaintInfo: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let author: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


