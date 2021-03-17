//
//  ContentView.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: TaskStore
    
    var body: some View {
        List(store.tasks) { task in
            TaskCell(task: task)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}
