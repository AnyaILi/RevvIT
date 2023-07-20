//
//  NewHabitTrackerView.swift
//  RevvIT
//
//  Created by Scholar on 7/18/23.
//

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(configuration.isOn ? Color(hex: "CDD7B6") : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

struct NewHabitTrackerView: View {
    @Environment(\.managedObjectContext) var context
    @Binding var showNewTask : Bool
    @State var title: String
    @State var sunday: Bool
    @State var monday: Bool
    @State var tuesday: Bool
    @State var wednesday: Bool
    @State var thursday: Bool
    @State var friday: Bool
    @State var saturday: Bool
    
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack{
                Text("Habit")
                    .font(.title)
                    .fontWeight(.bold)
                TextField("Enter the habit description...", text: $title)
                    .padding()
                    .background(Color(hex: "CDD7B6"))
                    .cornerRadius(15)
                    .padding()
                HStack{
                
                VStack{
                    Text("S  ")
                    Toggle(isOn: $sunday) {
                        
                        Text("")
                    }
                    .toggleStyle(CheckToggleStyle())
                    }
//                    .padding()
                
                VStack{
                    Text("M  ")
                    Toggle(isOn: $monday) {
                        
                        Text("")
                    }
                    .toggleStyle(CheckToggleStyle())
                }
                .padding(.leading)
//                    .padding()
                                    
                
                VStack{
                    Text("T  ")
                    Toggle(isOn: $tuesday) {
                        
                        Text("")
                    }
                    .toggleStyle(CheckToggleStyle())
                }
                .padding(.leading)
//                    .padding()
                VStack(){
                    Text("W  ")
                    Toggle(isOn: $wednesday) {
                        
                        Text("")
                    }
                 
                    .toggleStyle(CheckToggleStyle())
                }
                .padding(.leading)
//                    .padding()
                VStack{
                    Text("Th  ")
                    Toggle(isOn: $thursday) {
                        
                        Text("")
                    }
                    .toggleStyle(CheckToggleStyle())
                }
                .padding(.leading)
//                    .padding()
                VStack{
                    Text("F  ")
                    Toggle(isOn: $friday) {
                        
                        Text("")
                    }
                    .toggleStyle(CheckToggleStyle())
                }
                .padding(.leading)
//                    .padding()
                VStack{
                    Text("Sa  ")
                    Toggle(isOn: $saturday) {
                        
                        Text("")
                    }
                    .toggleStyle(CheckToggleStyle())
                }
                .padding(.leading)
//                    .padding()
                }
                Button(action: {
                    self.addTask(title: self.title, sunday: self.sunday, monday: self.monday, tuesday: self.tuesday, wednesday: self.wednesday, thursday: self.thursday, friday: self.friday, saturday: self.saturday)
                    self.showNewTask = false
                }) {
                    Text("Add")
                        .font(.title3)
                        .foregroundColor(Color.black)
                }
                .padding()
            }
        }
    }
    private func addTask(title: String, sunday: Bool = false, monday: Bool = false, tuesday: Bool = false, wednesday: Bool = false, thursday: Bool = false, friday: Bool = false, saturday: Bool = false) {
            
        let task = HabitTracker1(context: context)
        task.id = UUID()
        task.title = title
        task.sunday = sunday
        task.monday = monday
        task.tuesday = tuesday
        task.wednesday = wednesday
        task.thursday = thursday
        task.friday = friday
        task.saturday = saturday
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
        
    }
}

struct NewHabitTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitTrackerView(showNewTask: .constant(true), title: "", sunday: false, monday: false, tuesday: false, wednesday: false, thursday: false, friday: false, saturday: false)
    }
}
