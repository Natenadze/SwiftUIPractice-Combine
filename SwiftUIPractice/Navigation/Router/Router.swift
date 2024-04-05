//
//  Router.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI


final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    public enum Destination:  Hashable {
        case livingroom
        case bedroom(owner: String)
    }
    
    // MARK: - Methods
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
