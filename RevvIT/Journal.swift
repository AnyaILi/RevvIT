//
//  Journal.swift
//  RevvIT
//
//  Created by Scholar on 7/21/23.
//

import SwiftUI

struct Journal: View {
    @Environment(\.managedObjectContext) var context
    @State private var showNewTask = false
    @FetchRequest(
            entity: Journal1.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \Journal1.id, ascending: false) ])
        
    var toDoItems: FetchedResults<Journal1>
    var body: some View {
        ZStack{
            Color(hex: "#CDD7B6")
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("Journal")
                        
                        .fontWeight(.bold)
                        .font(.custom("KosugiMaru-Regular", size: 40))
                    Spacer()
        
                    
                    Button(action: {
                        self.showNewTask = true
                    }){
                        Text("+")
                            .font(.system(size:40))
                            .foregroundColor(Color.black)
                        
                    }
                    .buttonStyle(.borderedProminent)
                              .cornerRadius(300)
                              .tint(Color(hex:"8b9475"))
                              .controlSize(.regular)
                              .shadow(radius: 1)
                    
                    
                }
                .padding()
                Spacer()
                List {
                    ForEach (toDoItems) { toDoItem in
                        if toDoItem.important == true {
                            Text("‼️" + (toDoItem.text ?? "No title"))
                                .font(.custom("KosugiMaru-Regular", size: 20))
                                
                        } else {
                            Text(toDoItem.text ?? "No title")
                                .font(.custom("KosugiMaru-Regular", size: 20))
                        }
                        
                    }
                    .onDelete(perform: deleteTask)
                    
                }
                // .listStyle(.plain)
            }
            VStack{
                Spacer()
                HStack{
                    NavigationLink(destination: HabitTracker()) {
                        
                        Image("habit tracker")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        
                    }
                    NavigationLink(destination: Journal()) {
                        Image("journal")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        
                        
                    }
                    NavigationLink(destination: Homepage()) {
                        Image("home")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 70.0)
                        //                        .padding()
                    }
                    NavigationLink(destination: Check_InPage()) {
                        Image("emotion")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                    }
                    NavigationLink(destination: ToDo1()) {
                        Image("check list")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        //                        .padding()
                        
                        
                        
                    }
                    
                }//hstack
            }
            if showNewTask {
                NewJournalView(showNewTask: $showNewTask, text: "", important: false)
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

struct Journal_Previews: PreviewProvider {
    static var previews: some View {
        Journal()
    }
}
