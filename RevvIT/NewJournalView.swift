//
//  NewJournalView.swift
//  RevvIT
//
//  Created by Scholar on 7/21/23.
//

import SwiftUI

struct NewJournalView: View {
    @State private var promptRandom = "What's on your mind?"
    @State private var name = ""
    
        let prompts = ["Think about one thing that made you feel productive today.", "What made you smile today?", "Which of your strengths are you most grateful for?", "Write a letter to your younger self.", "What do you look forward to?", "What is something you learned recently?, "]
    
    @Environment(\.managedObjectContext) var context
    @Binding var showNewTask : Bool
    @State var text: String
    @State var important: Bool
    var body: some View {
        ZStack{
            Color(hex: "#F6EFE8")
                .ignoresSafeArea()
            
                
            Color(hex: "#F6EFE8")
            
                .cornerRadius(20)
            
            ZStack {
                
                VStack{
                    
                    VStack {
                        
                        
                        Text (promptRandom)
                            
                            .padding(.horizontal)
                            .font(.custom("KosugiMaru-Regular", size: 30))
                            .foregroundColor(Color(hex: "#31430A"))
                            
                    }
                    
                    
                    Button("New Prompt"){
                        
                        let random = Int.random (in:1..<6)
                        let prompt = prompts[random]
                        promptRandom = prompt
                    }//button
                    .foregroundColor(Color(hex: "#31430A"))
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex:"#CDD7B6"))
                    .font(.custom("KosugiMaru-Regular", size: 20))
                    
                    
                    
                    
                    .padding()
                    TextField("Thoughts...", text: $text, axis: .vertical)
                        .font(.custom("KosugiMaru-Regular", size: 20))
                        .lineLimit(15, reservesSpace:true)
                        .padding([.top, .leading, .trailing])
                        .background(Color(hex: "#CDD7B6"))
                        
                      
                        .cornerRadius(15)
                        .padding()
                    Toggle(isOn: $important) {
                        Text("Important?")
                            .font(.custom("KosugiMaru-Regular", size: 20))
                            

                        
                    }
                
                    .padding()
                    
                    Button(action: {
                        self.addTask(text: self.text, important: self.important)
                        self.showNewTask = false
                    }) {
                        Text("Add")
                            .fontWeight(.bold)
                            .font(.custom("KosugiMaru-Regular", size: 20))
                            .foregroundColor(Color(hex: "#31430A"))
                        
                            
                        
                    }
                    .padding()
                }
            }
            
        }
        
    }
    private func addTask(text: String, important: Bool = false) {
            
        let task = Journal1(context: context)
        task.id = UUID()
        task.text = text
        task.important = important
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
        
    }
    
}

struct NewJournalView_Previews: PreviewProvider {
    static var previews: some View {
        NewJournalView(showNewTask: .constant(true), text: "", important: false)
    }
}
