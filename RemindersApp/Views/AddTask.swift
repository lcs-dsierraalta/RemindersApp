//
//  AddTask.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-17.
//

import SwiftUI

struct AddTask: View {
    
    //Get a reference to the store of tasks (TaskStore)
    @ObservedObject var store: TaskStore
    
    //Details of the new task
    @State private var assignmentName = ""
    @State private var priority = TaskPriority.low
    @State private var course = ""
    @State private var dueDate = Date()
    
    //Whether to show this view
    @Binding var showing: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Description", text: $assignmentName)
                    
                    TextField("Enter course name", text: $course)
                    
                    DatePicker("Due Date:", selection: $dueDate, in: Date()...)
                        .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
                    
                    Picker("Priority", selection: $priority) {
                        Text(TaskPriority.low.rawValue).tag(TaskPriority.low)
                        Text(TaskPriority.medium.rawValue).tag(TaskPriority.medium)
                        Text(TaskPriority.high.rawValue).tag(TaskPriority.high)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("New Assignment")
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
        store.tasks.append(Task(assignmentName: assignmentName,
                                priority: priority,
                                completed: false,
                                course: course,
                                dueDate: dueDate))
        
        //Dismiss this view
        showing = false
        
    }
    
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(store: testStore, showing: .constant(true))
    }
}
