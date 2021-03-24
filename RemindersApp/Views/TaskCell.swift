//
//  TaskCell.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-17.
//

import SwiftUI

struct TaskCell: View {
    
    @ObservedObject var task: Task
    
    var taskColor: Color {
        switch task.priority {
        case .high:
            return Color.red
        case .medium:
            return Color.blue
        case .low:
            return Color.primary
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    
                    task.completed.toggle()
                    
                }
            
            VStack {
                Text(task.assignmentName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text(task.course)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    Text(task.dueDate, style: .date)
                }
                    
            }
        }
        .foregroundColor(self.taskColor)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: testData[0])
    }
}
