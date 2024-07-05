//
//  SwiftUIView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 01.06.24.
//

import SwiftUI

struct ContentView4: View {
    @State private var coordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.paths) {
            Screen1()
                .navigationDestination(for: Screens.self) { screen in
                    coordinator.navigate(to: screen)
                }
        }
        .environment(coordinator)
    }
}

struct Screen1: View {
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator

    var body: some View {
        VStack {
            Text("Screen 1")
                .font(.title)

            Button("Go to Screen 2") {
                coordinator.push(.screen2)
            }
        }
    }
}

struct Screen2: View {
    // Access coordinator object in the environment
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator

    var body: some View {
        Text("Screen 2")
            .font(.title)
        Button("Go to Screen 3") {
            coordinator.push(.screen3)
        }
    }
}

struct Screen3: View {
    // Access coordinator object in the environment
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator

    var body: some View {
        Text("Screen 3")
            .font(.title)
        Button("Back to root") {
            coordinator.popToRoot()
        }
    }
}

// Screens that we need to navigate
enum Screens {
    case screen1
    case screen2
    case screen3
}

// Object that will handle all the navigation
@Observable
class NavigationCoordinator {
    var paths = NavigationPath()

    @ViewBuilder
     func navigate(to screen: Screens) -> some View {
        switch screen {
        case .screen1:
            Screen1()
        case .screen2:
            Screen2()
        case .screen3:
            Screen3()
        }
    }

    // add screen
    func push(_ screen: Screens) {
        paths.append(screen)
    }

    // remove last screen
    func pop() {
        paths.removeLast()
    }

    // go to root screen
    func popToRoot() {
        paths.removeLast(paths.count)
    }
}



#Preview {
    ContentView4()
}
