//
//  SideNavigationApp.swift
//  SideNavigation
//
//  Created by Eric Dockery on 7/28/23.
//

import SwiftUI

@main
struct SideNavigationApp: App {
    let sideBarItems = [
        SideBarItem(imageName: "checkmark", title: "CheckMark", type: .page),
        SideBarItem(imageName: "circle", title: "Circle", type: .search),
        SideBarItem(imageName: "square", title: "Square", type: .settings),
    ]
    
    var body: some Scene {
        WindowGroup {
            HousingView(sideBarItems: sideBarItems, selectedTab: 0)
        }
    }
}
