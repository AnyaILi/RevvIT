//
//  Check-InPage.swift
//  RevvIT
//
//  Created by Scholar on 7/21/23.
//

import SwiftUI

struct Check_InPage: View {
    @State private var text = " "
      @State private var num = 0
      @State private var num1 = 0
      @State private var num2 = 0
      var body: some View {
        ZStack {
          Color(hex: "f6efe8")
            .ignoresSafeArea()
          VStack {
               Text("Check-in")
                 .font(.custom("KosugiMaru-Regular", size: 40))
               Text("How are you feeling?")
                  .font(.custom("KosugiMaru-Regular", size: 20))
               HStack{
                 Button(action:{
                   if (num==0)
                   {
                     text = "Yay! Let's keep it going. Write down 5 things you're grateful for in your journal."
                     num=1
                   }
                   else {
                     text = " "
                     num = 0
                   }
                 }) {
                   Image("smiling face")
                     .resizable(resizingMode: .stretch)
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 110.0)
                 }
                 Button(action:{
                   if (num1 == 0)
                   {
                     text = "Things could be better and they also could be worse. Push through! "
                     num1 = 1
                   }
                   else
                   {
                     text = ""
                     num1 = 0
                   }
                 }) {
                   Image("meh face")
                     .resizable(resizingMode: .stretch)
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 100.0)
                 }
                 Button(action:{
                   if (num2 == 0)
                   {
                     text = "Everybody has their days. It is important to know that your feelings are valid and it will always get better. Write down your feelings in your journal. "
                     num2 = 1
                   }
                   else
                   {
                     text = ""
                     num2 = 0
                   }
                 }) {
                   Image("sad face")
                     .resizable(resizingMode: .stretch)
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 120.0)
                 }
               }
               Text(text)
                 .padding()
               ZStack{
                 RoundedRectangle(cornerRadius: 20)
                   .fill(Color(hex: "CDD7B6"))
                 VStack(alignment: .leading) {
                   Text("Resources")
                         .font(.custom("KosugiMaru-Regular", size: 30))
                   Text("------------------")
                   Text("Substance Abuse and Mental Health Services Administration Hotline: 1-800-662-HELP (4357)")
                         .font(.custom("KosugiMaru-Regular", size: 18))
                   Link("\n StarVista Crisis Center",
                      destination: URL(string: "https://star-vista.org/programs/crisis-center/")!)
                   .font(.custom("KosugiMaru-Regular", size: 18))
                   Link("\n National Alliance on Mental Illness Helplines ",
                      destination: URL(string: "https://www.nami.org/help")!)
                   .font(.custom("KosugiMaru-Regular", size: 18))
                   Link("\n The Foundation for Art & Healing",
                      destination: URL(string: "https://www.artandhealing.org/community-programs-2/")!)
                   .font(.custom("KosugiMaru-Regular", size: 18))
                 }
                 .padding()
               }
               .padding()
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
          
         }
    
}

struct Check_InPage_Previews: PreviewProvider {
    static var previews: some View {
        Check_InPage()
    }
}
