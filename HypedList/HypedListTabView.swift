//
//  HypedListTabView.swift
//  HypedList
//
//  Created by ZappyCode on 10/17/20.
//

import SwiftUI

struct HypedListTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                UpcomingView()
            }
                .tabItem {
                    Image(systemName:"calendar")
                    Text("Upcoming")
                }
            NavigationView {
                DiscoverView()
            }
                .tabItem {
                    Image(systemName:"magnifyingglass")
                    Text("Discover")
                }
            NavigationView {
                PastView()
            }
                .tabItem {
                    Image(systemName:"gobackward")
                    Text("Past")
                }
        }
    }
}

struct HypedListTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListTabView()
    }
}
