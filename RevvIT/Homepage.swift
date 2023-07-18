//
//  Homepage.swift
//  RevvIT
//
//  Created by Scholar on 7/18/23.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack {
                Image("")
                
                Image(systemName: "")
                    .font(.system(size: 100))
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Check-in:")
                                .font(.title)
                                .foregroundColor(Color(hex: "8b8b8b"))
                            Text("How are you\nfeeling?")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                            
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.black)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color(hex: "eaece2"))
                    .mask(RoundedRectangle(cornerRadius: 10))
                    
                    
                }
                .padding()
                NavigationLink(destination: Text("")){
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Journal:")
                                .font(.title)
                                .foregroundColor(Color(hex: "000000"))
                            
                            Text("write down you \nthoughts...")
                                .foregroundColor(Color(hex: "687844"))
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)
                                .background(Color(hex: "aeb79b"))
                                .mask(RoundedRectangle(cornerRadius: 10))
                                .multilineTextAlignment(.leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.black)
                        
                    }
                    
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color(hex: "CDD7B6"))
                    .mask(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                NavigationLink(destination: HabitTracker()){
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Habit Tracker:")
                                .font(.title)
                                .foregroundColor(Color(hex: "000000"))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.black)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color(hex: "eaece2"))
                    .mask(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                NavigationLink(destination: Text("")){
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Make a moodboard:")
                                .font(.title)
                                .foregroundColor(Color(hex: "000000"))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.black)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color(hex: "CDD7B6"))
                    .mask(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                
            }
            .padding()
        }

    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
