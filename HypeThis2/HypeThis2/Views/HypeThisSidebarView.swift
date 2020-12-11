//
//  HypeThisSidebarView.swift
//  HypeThisiOS
//
//  Created by Dale Puckett on 12/3/20.
//

import SwiftUI

struct HypeThisSidebarView: View {
    
    @State var showingCreateView = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UpcomingView()) {
                    Label("Upcoming", systemImage: "calendar")
                }
                NavigationLink(destination: DiscoverView()) {
                    Label("Discover", systemImage: "magnifyingglass")
                }
                NavigationLink(destination: PastView()) {
                    Label("Past", systemImage: "gobackward")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("HypeThis")
            .overlay(bottomSidebarView, alignment: .bottom)
            
            
            UpcomingView()
            
            Text("Select an Event")
        }
    }
    
    var bottomSidebarView: some View {
        VStack {
            Divider()
            Button(action: {
                showingCreateView = true
            }) {
                Label("Create Event", systemImage: "calendar.badge.plus")
            }
            .sheet(isPresented: $showingCreateView) {
                CreateHypedEventView()
            }
        }
    }
}

struct HypeThisSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        HypeThisSidebarView()
    }
}
