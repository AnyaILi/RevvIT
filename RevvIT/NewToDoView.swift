//
//  NewToDoView.swift
//  RevvIT
//
//  Created by Scholar on 7/20/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    @Binding var showNewTask : Bool
    @State var title: String
    @State var isImportant: Bool
    var body: some View {
        VStack{
            Text("Task")
                .font(.custom("KosugiMaru-Regular", size: 40))
                .fontWeight(.semibold)
                .foregroundColor(Color(hex:"8b9475"))
                .shadow(radius: 1)
            TextField("Enter the task description...", text: $title)
                .font(.custom("KosugiMaru-Regular", size: 20))
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
                    .font(.custom("KosugiMaru-Regular", size: 20))
            }
            .padding()
            
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }) {
                Text("Add")
                    .font(.custom("KosugiMaru-Regular", size: 20))
            }
            .buttonStyle(.borderedProminent)
            .cornerRadius(27)
            .controlSize(.large)
            .tint(Color(hex: "8b9475"))
            .shadow(radius: 1)
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
        NewToDoView(showNewTask: .constant(true), title: "", isImportant: false)
    }
}
