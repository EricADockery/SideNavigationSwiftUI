//
//  ContentContainerView.swift
//  SideNavigation
//
//  Created by Eric Dockery on 7/28/23.
//

import SwiftUI

struct ContentContainerView: View {
    @Binding var selectedTab: SideBarItem
    
    var body: some View {
        selectedTab.selectedContent
    }
}

struct ContentContainerView_Previews: PreviewProvider {
    @State static var selectedItem: SideBarItem = SideBarItem(imageName: "circle", title: "Circle", type: .page)
    static var previews: some View {
        ContentContainerView(selectedTab: $selectedItem)
    }
}
