//
//  Task.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-16.
//

import Foundation

enum TaskCodingKeys: CodingKey{
    case description
    case priority
    case completed
    case course
}

class Task: Identifiable, ObservableObject, Codable {
    
    var id = UUID()
    var description: String
    var priority: TaskPriority
    @Published var completed: Bool
    var course: String
    
    internal init(id: UUID = UUID(), description: String, priority: TaskPriority, completed: Bool, course: String) {
        self.id = id
        self.description = description
        self.priority = priority
        self.completed = completed
        self.course = course
    }
    
    // Provide details for how to decode from JSON into an instance of this data type
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TaskCodingKeys.self)

        // Decode "description" property into an instance of the String type
        self.description = try container.decode(String.self, forKey: .description)
        // Decode "priority" property into an instance of the TaskPriority type
        self.priority = try container.decode(TaskPriority.self, forKey: .priority)
        // Decode "completed" property into an instance of the Bool type
        self.completed = try container.decode(Bool.self, forKey: .completed)
        // Decode "course" property into an instance of the string type
        self.course = try container.decode(String.self, forKey: .course)
    }

    // Provide details for how to encode to JSON from an instance of this type
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: TaskCodingKeys.self)

        // Everything is encoded into String types
        try container.encode(description, forKey: .description)
        try container.encode(priority.rawValue, forKey: .priority)
        try container.encode(completed, forKey: .completed)

    }

}



let testData = [
    Task(description: "Do problem set", priority: .high, completed: false, course: "Physics"),
    Task(description: "Finish essay", priority: .medium, completed: true, course: "English"),
    Task(description: "Prepare presentation", priority: .low, completed: false, course: "Computer Science")
]
