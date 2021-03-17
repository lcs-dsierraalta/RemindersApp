//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-16.
//

import SwiftUI

@main
struct RemindersAppApp: App {
    
   @StateObject private var store = TaskStore(tasks: testData)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(store: store)
            }
        }
    }
}
