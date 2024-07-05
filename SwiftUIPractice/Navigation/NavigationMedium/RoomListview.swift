//
//  RoomListview.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 01.06.24.
//

import SwiftUI

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

#Preview {
    RoomsListView(rooms:
                    [    RoomInfo(name: "asd", image: Image("finger")),
                         RoomInfo(name: "asd 2", image: Image("finger"))]
    )
}

