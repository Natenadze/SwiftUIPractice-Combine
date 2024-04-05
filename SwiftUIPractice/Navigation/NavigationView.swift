//
//  NavigationView.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 06.01.24.
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


// MARK: - room list

struct RoomsListView: View {
    
    private var rooms: [RoomInfo]
    
    init(rooms: [RoomInfo]) {
        self.rooms = rooms
    }
    
    var body: some View {
        NavigationStack {
            List(rooms) { room in
                NavigationLink(room.name, value: room)
            }
            .navigationTitle("House Rooms")
            .navigationDestination(for: RoomInfo.self) { room in
                RoomDetail(roomInfo: room)
            }
        }
    }
}


//#Preview {
//    RoomsListView(rooms: [RoomInfo(name: "asd", image: Image("finger")),
//                         RoomInfo(name: "asd 2", image: Image("finger"))
//                         ])
//}
//


// MARK: - Nav Path

struct PaintInfo: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let author: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct HomeListView: View {
    
    @State private var navPath = NavigationPath()
    private var roomsInfo = [RoomInfo]()
    private var paintsInfo = [PaintInfo]()
    
    init(rooms: [RoomInfo], paints: [PaintInfo]) {
        self.roomsInfo = rooms
        self.paintsInfo = paints
        
//        roomsInfo.forEach { navPath.append($0) }
    }
    
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
        
            NavigationStack(path: $navPath) {
                List(roomsInfo) { room in
                    NavigationLink(room.name, value: room)
                }
                .navigationDestination(for: RoomInfo.self) { room in
                    RoomDetail(roomInfo: room)
                }
                
                Button("Show Art Paints") {
                    navPath.append(paintsInfo)
                }
                .frame(height: 100)
                .navigationTitle("House")
                .navigationDestination(for: [PaintInfo].self) { paints in
                    List(paints) { paint in
                        VStack {
                            Text(paint.name)
                                .font(.system(size: 18, weight: .bold))
                            Text("\(paint.author)")
                        }
                    }
                }
            }
            
        }
        
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
