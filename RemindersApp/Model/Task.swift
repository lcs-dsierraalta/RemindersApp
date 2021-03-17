//
//  Task.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-16.
//

import Foundation

class Task: Identifiable, ObservableObject {
    
    var id = UUID()
    var description: String
    var priority: TaskPriority
    @Published var completed: Bool
    
    internal init(id: UUID = UUID(), description: String, priority: TaskPriority, completed: Bool) {
        self.id = id
        self.description = description
        self.priority = priority
        self.completed = completed
    }

}

let testData = [
    Task(description: "Do Homework", priority: .high, completed: false),
    Task(description: "Eat Oreos", priority: .medium, completed: true),
    Task(description: "Play Games", priority: .low, completed: false)
]
