//
//  Task.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-16.
//

import Foundation

enum TaskCodingKeys: CodingKey{
    case assignmentName
    case priority
    case completed
    case course
    case dueDate
}

class Task: Identifiable, ObservableObject, Codable {
    
    var id = UUID()
    var assignmentName: String
    var priority: TaskPriority
    @Published var completed: Bool
    var course: String
    var dueDate = Date()
    
    internal init(id: UUID = UUID(), assignmentName: String, priority: TaskPriority, completed: Bool, course: String, dueDate: Date) {
        self.id = id
        self.assignmentName = assignmentName
        self.priority = priority
        self.completed = completed
        self.course = course
        self.dueDate = dueDate
    }
    
    // Provide details for how to decode from JSON into an instance of this data type
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TaskCodingKeys.self)

        // Decode "description" property into an instance of the String type
        self.assignmentName = try container.decode(String.self, forKey: .assignmentName)
        // Decode "priority" property into an instance of the TaskPriority type
        self.priority = try container.decode(TaskPriority.self, forKey: .priority)
        // Decode "completed" property into an instance of the Bool type
        self.completed = try container.decode(Bool.self, forKey: .completed)
        // Decode "course" property into an instance of the string type
        self.course = try container.decode(String.self, forKey: .course)
        // Decode "dueDate" property into an instance of the Date type
        self.dueDate = try container.decode(Date.self, forKey: .dueDate)
    }

    // Provide details for how to encode to JSON from an instance of this type
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: TaskCodingKeys.self)

        // Everything is encoded into String types
        try container.encode(assignmentName, forKey: .assignmentName)
        try container.encode(priority.rawValue, forKey: .priority)
        try container.encode(completed, forKey: .completed)
        try container.encode(course, forKey: .course)
        try container.encode(dueDate, forKey: .dueDate)

    }

}



let testData = [
    Task(assignmentName: "Do problem set", priority: .high, completed: false, course: "Physics", dueDate: Date()),
    Task(assignmentName: "Finish essay", priority: .medium, completed: true, course: "English", dueDate: Date()),
    Task(assignmentName: "Prepare presentation", priority: .low, completed: false, course: "Computer Science", dueDate: Date())
]
