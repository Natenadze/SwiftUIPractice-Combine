//
//  HomeListView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 01.06.24.
//
// https://blorenzop.medium.com/routing-navigation-in-swiftui-f1f8ff818937 

import SwiftUI

struct HomeListView: View {
    
    @State private var navPath = NavigationPath()
    private var rooms = [RoomInfo]()
    private var paintsInfo = [PaintInfo]()
    
    init(rooms: [RoomInfo], paints: [PaintInfo]) {
        self.rooms = rooms
        self.paintsInfo = paints
    }
    
    var body: some View {
        NavigationStack(path: $navPath) {
            List(rooms) { room in
                NavigationLink(room.name, value: room)
            }
            .navigationDestination(for: RoomInfo.self) { room in
                RoomDetail(roomInfo: room)
            }
            
            Button("Show Art Paints") {
                navPath.append(paintsInfo)
            }
            .navigationTitle("House")
            .navigationDestination(for: [PaintInfo].self) { paints in
                List(paints) { paint in
                    VStack {
                        Text(paint.name)
                        
                        Text("\(paint.author)")
                    }
                }
            }
        }
//        .onAppear(perform: {
//            self.rooms.forEach { navPath.append($0) }
//        })
    }
    
}





#Preview {
    HomeListView(rooms: [RoomInfo(name: "room 1", image: Image("finger")),
                         RoomInfo(name: "room 2", image: Image("finger")),
                         RoomInfo(name: "room 3", image: Image("finger")),
                         RoomInfo(name: "room 4", image: Image("finger"))
                        ],
                 paints: [PaintInfo(name: "paint 1", author: "jumbera"),
                          PaintInfo(name: "paint 2", author: " mevludi")
                         ])
}





