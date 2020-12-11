//
//  MainView.swift
//  HypeThis
//
//  Created by Dale Puckett on 12/3/20.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            HypeThisTabView()
        } else {
            HypeThisSidebarView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
