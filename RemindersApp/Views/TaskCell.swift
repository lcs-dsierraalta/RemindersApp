//
//  TaskCell.swift
//  RemindersApp
//
//  Created by Diego Sierraalta on 2021-03-17.
//

import SwiftUI

struct TaskCell: View {
    
    @ObservedObject var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    
                    task.completed.toggle()
                    
                }
            
            Text(task.description)
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: testData[0])
    }
}
