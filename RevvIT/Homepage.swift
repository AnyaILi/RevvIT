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
            Color(hex: "F6EFE8")
               .ignoresSafeArea()
             VStack {
               Image("")
               Image(systemName: "")
                 .font(.system(size: 100))
                 
                 Text("RevvIT")
                     .font(.custom("KosugiMaru-Regular", size: 60))
                     .fontWeight(.medium)
                     .foregroundColor(Color(hex: "8b9475"))
                     .shadow(radius: 2)
                    
                 Image("lilypad")
                     .resizable(resizingMode: .stretch)
                     .aspectRatio(contentMode: .fit)
                     .shadow(radius: 1)
                     .opacity(0.7)

               NavigationLink(destination: Check_InPage()) {
                 HStack{
                   VStack(alignment: .leading){
                     Text("Check-in:")
                           .font(.custom("KosugiMaru-Regular", size: 27))
                       .foregroundColor(Color(hex: "8b8b8b"))
                       Text("How are you\nfeeling?")
                           .fontWeight(.light)
                           .font(.custom("KosugiMaru-Regular", size: 18))
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
                 .mask(RoundedRectangle(cornerRadius: 20))
                 .shadow(radius:5)
               }
               .padding()
               NavigationLink(destination: Journal()){
                 HStack{
                   VStack(alignment: .leading) {
                     Text("Journal:")
                           .font(.custom("KosugiMaru-Regular", size: 27))
                       .foregroundColor(Color(hex: "000000"))
                       Text("write down your \nthoughts...")
                           .fontWeight(.light)
                           .font(.custom("KosugiMaru-Regular", size: 15))
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
                 .mask(RoundedRectangle(cornerRadius: 20))
                 .shadow(radius:5)
               }
               .padding()
               NavigationLink(destination: HabitTracker()){
                 HStack{
                   VStack(alignment: .leading) {
                     Text("Habit Tracker:")
                           .font(.custom("KosugiMaru-Regular", size: 27))
                       .foregroundColor(Color(hex: "000000"))
                   }
                   .frame(maxWidth: .infinity, alignment: .leading)
                   Image(systemName: "chevron.right")
                     .foregroundColor(Color.black)
                 }
                 .padding(.horizontal, 30)
                 .padding(.vertical, 10)
                 .background(Color(hex: "eaece2"))
                 .mask(RoundedRectangle(cornerRadius: 20))
                 .shadow(radius:5)
                   
               }
               .padding()
               NavigationLink(destination: ToDo1()){
                 HStack{
                   VStack(alignment: .leading) {
                     Text("To-Do:")
                           .font(.custom("KosugiMaru-Regular", size: 27))
                       .foregroundColor(Color(hex: "000000"))
                   }
                   .frame(maxWidth: .infinity, alignment: .leading)
                   Image(systemName: "chevron.right")
                     .foregroundColor(Color.black)
                 }
                 .padding(.horizontal, 30)
                 .padding(.vertical, 10)
                 .background(Color(hex: "CDD7B6"))
                 .mask(RoundedRectangle(cornerRadius: 20))
                 .shadow(radius: 5)
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
