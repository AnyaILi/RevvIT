//
//  HabitTracker.swift
//  RevvIT
//
//  Created by Scholar on 7/18/23.
//

import SwiftUI

struct HabitTracker: View {
    @Environment(\.managedObjectContext) var context
    @State private var showNewTask = false
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack {
                HStack{
                    
                    Text("Habit Tracker")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Spacer()
                    
                    Button(action: {
                        self.showNewTask = true
                    }){
                        Text("+")
                            .font(.system(size: 40))
                            .foregroundColor(Color.black)
                    }
                }
                .padding()
                Spacer()
                List {
                    ForEach (toDoItems) { toDoItem in
                        NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                            Text(toDoItem.title ?? "No title")
                                .listRowBackground(Color(hex: "CDD7B6"))
                        }
                                                
                    }
                    .onDelete(perform: deleteTask)
                    
                }
                // .listStyle(.plain)
                

            }
            
            if showNewTask {
                NewHabitTrackerView(showNewTask: $showNewTask, title: "")
                //        isImportant: false)
            }
            
            
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

struct HabitTracker_Previews: PreviewProvider {
    static var previews: some View {
        HabitTracker()
    }
}
