//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Davit Natenadze on 21.09.23.
//

import SwiftUI

@main
struct SwiftUIPracticeApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView2()
//            HomeView()
//            Subscriber()
//            DownloadWithCombine()
//            NotificationView()
            HomeListView(rooms: [RoomInfo(name: "room 1", image: Image("finger")),
                                 RoomInfo(name: "room 2", image: Image("finger")),
                                 RoomInfo(name: "room 3", image: Image("finger")),
                                 RoomInfo(name: "room 4", image: Image("finger"))
                                ],
                         paints: [PaintInfo(name: "paint 1", author: "jumbera"),
                                  PaintInfo(name: "paint 2", author: " mevludi")
                                 ])
        }
    }
}
