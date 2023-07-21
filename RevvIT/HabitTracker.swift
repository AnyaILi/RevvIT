//
//  HabitTracker.swift
//  RevvIT
//
//  Created by Scholar on 7/18/23.
//

import SwiftUI

public var item1 = ""


struct HabitTracker: View {
    @Environment(\.managedObjectContext) var context
    @State private var showNewTask = false
//    @State private var item1 = ""
    @FetchRequest(
            entity: HabitTracker1.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \HabitTracker1.id, ascending: false) ])
    
    var habitItems: FetchedResults<HabitTracker1>
    
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack {
                HStack{
                    
                    Text("Habit Tracker")
                        .font(.custom("KosugiMaru-Regular", size: 40))
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
                    ForEach(habitItems) { habitItem in
                        let days = [
                            habitItem.sunday == true ? "Sun" : nil,
                            habitItem.monday == true ? "Mon" : nil,
                            habitItem.tuesday == true ? "Tue" : nil,
                            habitItem.wednesday == true ? "Wed" : nil,
                            habitItem.thursday == true ? "Thur" : nil,
                            habitItem.friday == true ? "Fri" : nil,
                            habitItem.saturday == true ? "Sat" : nil,
                            // Add other days' handling as needed...
                        ]
                            .compactMap { $0 }
                            .joined(separator: ", ")
                        
                        let title = habitItem.title ?? "No title"
                        let displayText = days.isEmpty ? title : title + "\n" + days
                        Text(displayText)
                            .font(.custom("KosugiMaru-Regular", size: 20))
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
        }
            
            if showNewTask {
                NewHabitTrackerView(showNewTask: $showNewTask, title: "", sunday: false, monday: false, tuesday: false, wednesday: false, thursday: false, friday: false, saturday: false)
            }
            
            
//        }
        
    }
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
            offsets.map { habitItems[$0] }.forEach(context.delete)

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
