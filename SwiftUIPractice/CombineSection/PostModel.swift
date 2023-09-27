//
//  PostModel.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 22.09.23.
//

import Foundation

// MARK: - Model

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
