//
//  HousingView.swift
//  SideNavigation
//
//  Created by Eric Dockery on 7/28/23.
//

import SwiftUI

protocol ContentView { }

struct HousingView: View {
    private var sideBarItems: [SideBarItem]
    
    @State var selectedTab: SideBarItem
    @FocusState var sideBarFocused: Bool?

    init(sideBarItems: [SideBarItem],
         selectedTab: Int) {
        self.sideBarItems = sideBarItems
        self.selectedTab = sideBarItems[selectedTab]
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .top,
                   spacing: 20.0) {
                SideNavClosedSpacerView()
                ContentContainerView(selectedTab: $selectedTab)
                    .focusable(sideBarFocused ?? false)
                    .focused($sideBarFocused, equals: false)
            }
                .focusSection()
            SideNavigationView(selectedItem: $selectedTab,
                               sideBarItems: sideBarItems)
            .focused($sideBarFocused, equals: true)
            .focusSection()
        }
        .onChange(of: sideBarFocused) { oldValue, newValue in
            if newValue == true {
                print("Focused on side bar")
            } else {
                print("Focused on content")
            }
        }
    }
}

#Preview {
    HousingView(sideBarItems: [SideBarItem(imageName: "checkmark",
                                           title: "checkMark", type: .search),
                               SideBarItem(imageName: "circle", title: "Circle", type: .search)], selectedTab: 1)
}
