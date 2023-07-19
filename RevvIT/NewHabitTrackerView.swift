//
//  NewHabitTrackerView.swift
//  RevvIT
//
//  Created by Scholar on 7/18/23.
//

import SwiftUI

struct NewHabitTrackerView: View {
    @Environment(\.managedObjectContext) var context
    @Binding var showNewTask : Bool
    @State var title: String
//    @State var isImportant: Bool
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack{
                Text("Habit Title")
                    .font(.title)
                    .fontWeight(.bold)
                TextField("Enter the habit description...", text: $title)
                    .padding()
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(15)
                    .padding()
                //            Toggle(isOn: $isImportant) {
                //                Text("Is it important?")
                //            }
                    .padding()
                
                Button(action: {
                    self.addTask(title: self.title)
                    //                             isImportant: self.isImportant)
                    self.showNewTask = false
                }) {
                    Text("Add")
                }
                .padding()
            }
        }
    }
    private func addTask(title: String, isImportant: Bool = false) {
            
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        //task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
        
    }
}

struct NewHabitTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitTrackerView(showNewTask: .constant(true), title: "")
//    isImportant: false)
    }
}
