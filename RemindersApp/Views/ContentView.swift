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
        .navigationTitle("Assignments")
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
        
        // When the app is quit or backgrounded, this closure will run
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            
            // Save the list of tasks
            let encoder = JSONEncoder()
            do {
                let encoded = try encoder.encode(store.tasks)
                print("Saving tasks list now, app has been backgrounded or quit...")
                // Actually save the tasks to UserDefaults
                UserDefaults.standard.setValue(encoded, forKey: "tasks1")
            } catch {
                print(error)
            }
            
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
