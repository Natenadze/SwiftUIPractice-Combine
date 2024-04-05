//
//  HomeView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

// MARK: - Use router

struct HomeView: View {

    @ObservedObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            VStack {
                Image(systemName: "house.fill")
                    .font(.system(size: 56))
                    .foregroundColor(.accentColor)
                
                Text("Home")
                    .font(.system(size: 24))
                
                
//                Button("Go to living room", action: {
//                    router.navigate(to: LivingroomView(router: router))
//                })
                
                Button("Go to Bedroom", action: {
                    router.navigate(to: .bedroom(owner: "Bondo"))
                })
                
                Button("Go to Living room", action: {
                    router.navigate(to: .livingroom)
                })
                
                .padding(.top, 12)

            }
//            .navigationDestination(for: LivingroomView.self) { asd in
//                LivingroomView(router: router)
//            }
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .livingroom: LivingroomView(router: router)
                case .bedroom(let owner): BedroomView(router: router, ownerName: owner)
                }
            }
        }
   
    }
}



#Preview {
     HomeView()
}
