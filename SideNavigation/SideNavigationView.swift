//
//  SideNavigationView.swift
//  SideNavigation
//
//  Created by Eric Dockery on 7/28/23.
//

import SwiftUI

enum ContentType: Codable {
    case page
    case settings
    case search
}

struct SideBarItem: Codable, Hashable {
    var imageName: String
    var title: String
    var type:ContentType
    
    @ViewBuilder var selectedContent: some View {
        switch type {
        case .page:
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Text("Hello Page")
                        .focusable(true)
                    Spacer()
                }
                Spacer()
            }
            .background(Color(.blue))
        case .settings:
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Text("Hello Settings")
                        .focusable(true)
                    Spacer()
                }
                Spacer()
            }
            .background(Color(.red))
        case .search:
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Text("Hello Search")
                        .focusable(true)
                    Spacer()
                }
                Spacer()
            }
            .background(Color(.brown))
        }
    }
}

struct SideNavigationView: View {
    @Binding var selectedItem: SideBarItem
    private var sideBarItems: [SideBarItem]
    
    @State var isFocused = false
    @FocusState var focusedTabItem: SideBarItem?
   
    var imageName: String {
        isFocused ? "expandedLogo" : "logo"
    }
    init(selectedItem: Binding<SideBarItem>,
         sideBarItems: [SideBarItem]) {
        self._selectedItem = selectedItem
        self.sideBarItems = sideBarItems
    }
    
    var body: some View {
        VStack(alignment:.center,
               spacing: 20.0) {
            HStack(alignment: .center) {
                Spacer()
                Image(imageName, bundle: nil)
                    .resizable()
                    .frame(minWidth: 100, maxHeight: 100)
                Spacer()
            }
            Spacer()
            ForEach(sideBarItems, id: \.self) { item in
                if item.type == .settings {
                    Spacer()
                }
                SideBarItemView(sideBarItem: item, selectedItem: $selectedItem, isExpanded: $isFocused)
                    .focused($focusedTabItem, equals: item)
            }
        }
               .onChange(of: focusedTabItem, initial: false, { oldValue, newValue in
                   isFocused = newValue != nil
               })
               .onChange(of: isFocused, initial: false, { oldValue, newValue in
                   if newValue == false {
                       focusedTabItem = nil
                   } else if newValue == true {
                       focusedTabItem = selectedItem
                   }
               })
               .background(Color(.orange))
               .frame(width: isFocused ? 300 : 50)
               .animation(.easeInOut, value: isFocused)
    }
}

struct SideNavigationView_Previews: PreviewProvider {
    @State static var selectedTab: SideBarItem =
        sideBarItems[0]
    
    static let sideBarItems = [
        SideBarItem(imageName: "checkmark", title: "CheckMark", type: .page),
        SideBarItem(imageName: "circle", title: "Circle", type: .search),
        SideBarItem(imageName: "square", title: "Square", type: .settings),
    ]
    static var previews: some View {
        SideNavigationView(selectedItem: $selectedTab, sideBarItems: sideBarItems)
    }
}
