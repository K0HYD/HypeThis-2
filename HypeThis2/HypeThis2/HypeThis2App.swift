//
//  HypeThis2App.swift
//  HypeThis2
//
//  Created by Dale Puckett on 12/11/20.
//

import SwiftUI

@main
struct HypeThis2App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    DataController.shared.loadData()
                    DataController.shared.getDiscoverEvents()
                }
        }
    }
}
