//
//  arina_scanApp.swift
//  arina-scan
//
//  Created by Ademie  on 04/10/2023.
//

import SwiftUI

@main
struct arina_scanApp: App {
//    Connect the delegate file and execute the appdidfinishlaunch function
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                InventoryListView()
            }
        }
    }
}
