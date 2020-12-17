//
//  ContentView.swift
//  HypeThis2Watch Extension
//
//  Created by Dale Puckett on 12/15/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var data = WatchToPhoneDataController.shared
    
    var body: some View {
        HypeThis2WatchListView(hypedEvents: data.hypedEvents)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
