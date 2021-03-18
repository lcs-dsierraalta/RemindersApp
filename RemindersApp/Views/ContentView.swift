//
//  ContentView.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    //Stores all tasks that are being tracked
    @ObservedObject var store: TaskStore
    
    //Controls wether the add task is shwoing
    @State private var showingAddTask = false
    
    var body: some View {
        List(store.tasks) { task in
            TaskCell(task: task)
        }
        .navigationTitle("Reminders")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add") {
                    showingAddTask = true
                }
            }
        }
        .sheet(isPresented: $showingAddTask) {
            AddTask(store: store, showing: $showingAddTask)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(store: testStore)
        }
    }
}
