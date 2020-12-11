//
//  HypeThisTabView.swift
//  HypeThis
//
//  Created by Dale Puckett on 11/18/20.
//

import SwiftUI

struct HypeThisTabView: View {
    var body: some View {
            TabView {
                NavigationView {
                    UpcomingView()
                }
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Upcoming")
                    }
                NavigationView {
                    DiscoverView()
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Discover")
                }
                NavigationView {
                    PastView()
                }
                    .tabItem {
                        Image(systemName: "gobackward")
                        Text("Past")
                } 
            }
        }
    }

struct HypeThisTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypeThisTabView()
    }
}
