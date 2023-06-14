//
//  NewToDoView.swift
//  ToDoListCodeAlong
//
//  Created by Dilan Hasthantra on 6/13/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    
    @State var title: String
    @State var isImportant: Bool
    
//    @Binding var toDoItems: [ToDoItem]
    @Binding var showNewTask : Bool
    
    var body: some View {
        VStack{
            Text("Add a new task")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter the taks description", text: $title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
            }
            .padding()
            
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }) {
                Text("Add")
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .cornerRadius(15)
            .padding()
        }
    }
    private func addTask(title: String, isImportant: Bool = false) {
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                try context.save()
        } catch {
                print(error)
        }
        }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title:"", isImportant: false,showNewTask: .constant(true))
    }
}
