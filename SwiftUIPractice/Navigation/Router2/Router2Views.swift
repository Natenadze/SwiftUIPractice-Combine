//
//  Router2Views.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 17.01.24.
//

import SwiftUI


struct ContentView2: View {
    var body: some View {
        RouterView {
            ViewA()
        }
    }
}

// MARK: - View A

struct ViewA: View {
    @EnvironmentObject var router: Router2
    
    var body: some View {
        VStack() {
            Button("Go to View B") {
                router.navigateTo(.viewB("Got here from A"))
            }
            Button("Go to View C") {
                router.navigateTo(.viewC)
            }
        }
        .navigationTitle("View A")
    }
}

// MARK: - ViewB

struct ViewB: View {
    @EnvironmentObject var router: Router2
    let description: String
    
    var body: some View {
        VStack() {
            Text(description)
            Button("Go to View A") {
                router.navigateTo(.viewA)
            }
            Button("Go to View C") {
                router.navigateTo(.viewC)
            }
        }
        .navigationTitle("View B")
    }
}

// MARK: - ViewC

struct ViewC: View {
    @EnvironmentObject var router: Router2
    
    var body: some View {
        VStack() {
            Button("Go to View B") {
                router.navigateTo(.viewB("Got here from C"))
            }
            Button("Go back") {
                router.navigateBack()
            } 
            
            Button("Go Home") {
                router.popToRoot()
            }
        }
        .navigationTitle("View C")
    }
}


struct ViewAOld: View {
    var body: some View {
        // 1
        NavigationStack {
            VStack {
                Text("This is ViewA")
                
                NavigationLink("ViewB", value: 1)
            }
            .navigationDestination(for: Int.self) { _ in
                
//                ViewB()
            }
        }
    }
}
