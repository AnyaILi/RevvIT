//
//  ToDo1.swift
//  RevvIT
//
//  Created by Scholar on 7/20/23.
//

import SwiftUI

struct ToDo1: View {
    @Environment(\.managedObjectContext) var context
    @State private var showNewTask = false
    @FetchRequest(
        entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    var body: some View {
        ZStack {
            Color(hex: "F6EFE8")
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("To-Do List")
                        .font(.system(size: 50))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: "8b9475"))
                        .shadow(radius: 1)
                    Spacer()
                    
                    Button(action: {
                        self.showNewTask = true
                    }){
                        Text("+")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(100)
                    .tint(Color(hex:"8b9475"))
                    .controlSize(.regular)
                    .shadow(radius: 1)
                }
                .padding()
                Spacer()
                List {
                    ForEach (toDoItems) { toDoItem in
                        if toDoItem.isImportant == true {
                            Text("‼️ " + (toDoItem.title ?? "No title"))
                        } else {
                            Text(toDoItem.title ?? "No title")
                        }
                        
                    }
                    .onDelete(perform: deleteTask)
                }
                // .listStyle(.plain)
            }
        }
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, title: "", isImportant: false)
            }
            
        }
        private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)
                
                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    
}

struct ToDo1_Previews: PreviewProvider {
    static var previews: some View {
        ToDo1()
    }
}
