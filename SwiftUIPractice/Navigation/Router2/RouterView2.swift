//
//  RouterView2.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 17.01.24.
//

import SwiftUI




class Router2: ObservableObject {
    // Contains the possible destinations in our Router
    enum Route: Hashable {
        case viewA
        case viewB(String)
        case viewC
    }
    
    // Used to programatically control our navigation stack
    @Published var path = NavigationPath()
    
    // Builds the views
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .viewA:
            ViewA()
        case .viewB(let str):
            ViewB(description: str)
        case .viewC:
            ViewC()
        }
    }
    
    // Used by views to navigate to another view
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    // Used to go back to the previous screen
    func navigateBack() {
        path.removeLast()
    }
    
    // Pop to the root screen in our hierarchy
    func popToRoot() {
        path.removeLast(path.count)
    }
}


// View containing the necessary SwiftUI code to utilize a NavigationStack for navigation accross our views.

struct RouterView<Content: View>: View {
    
    @StateObject var router: Router2 = Router2()
    // Our root view content
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router2.Route.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
    }
}
