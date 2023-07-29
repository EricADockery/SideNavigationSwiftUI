//
//  SideBarItemView.swift
//  SideNavigation
//
//  Created by Eric Dockery on 7/28/23.
//

import SwiftUI

struct SideBarItemView: View {
    let sideBarItem: SideBarItem
    @Binding var selectedItem: SideBarItem
    @Binding var isExpanded: Bool
    
    var body: some View {
        Button(action: updateSelectedItem) {
            HStack(spacing: 10.0) {
                Image(systemName: sideBarItem.imageName)
                if isExpanded {
                    Text(sideBarItem.title)
                }
            }
        }
    }
    
    func updateSelectedItem() {
        selectedItem = sideBarItem
        isExpanded = false
    }
}

struct SideBarItemView_Previews: PreviewProvider {
    @State static var isFocused = true
    @State static var selectedItem: SideBarItem = SideBarItem(imageName: "circle", title: "Circle", type: .page)
    static var previews: some View {    SideBarItemView(sideBarItem: SideBarItem(imageName: "checkmark", title: "Test", type: .page), selectedItem: $selectedItem, isExpanded: $isFocused)
    }
}
