//
//  AddTask.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-17.
//

import SwiftUI

struct AddTask: View {
    
    //Get a reference to the sotre of tasks (TaskStore)
    @ObservedObject var store: TaskStore
    
    //Details of the new task
    @State private var description = ""
    @State private var priority = TaskPriority.low
    @State private var course = ""
    
    //Whether to show this view
    @Binding var showing: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Description", text: $description)
                    
                    TextField("Enter course name", text: $course)
                    
                    Picker("Priority", selection: $priority) {
                        Text(TaskPriority.low.rawValue).tag(TaskPriority.low)
                        Text(TaskPriority.medium.rawValue).tag(TaskPriority.medium)
                        Text(TaskPriority.high.rawValue).tag(TaskPriority.high)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("New Reminder")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                    saveTask()
                }
            }
        }
    }
}
    
    func saveTask() {
        
        //Add the task to the list of tasks
        store.tasks.append(Task(description: description,
                                priority: priority,
                                completed: false,
                                course: course))
        
        //Dismiss this view
        showing = false
        
    }
    
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(store: testStore, showing: .constant(true))
    }
}
