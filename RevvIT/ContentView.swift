//
//  ContentView.swift
//  RevvIT
//
//  Created by Scholar on 7/18/23.
//

import Foundation
import UIKit
import SwiftUI
 var newQuote1 = quote()
// var newQuote = newQuote1.randQA()
var num1 = newQuote1.randNum()
struct ContentView: View {
  var body: some View {
    
    NavigationStack{
        VStack{
            ZStack{
                Color(hex: "F6EFE8")
                    .edgesIgnoringSafeArea(.all)
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(hex: "CDD7B6"))
                        .shadow(radius:3)
                        .padding(.horizontal, 15)
                    .padding(.vertical, 10)}
                .padding()
                VStack{
                    Text("RevvIT")
                        .font(.custom("KosugiMaru-Regular", size: 60))
                        .fontWeight(.semibold)
                        .shadow(radius: 1)
                        .padding()
                    Spacer()
                        .frame(height: 40)
                    //            randomNum = 3
                    Text(newQuote1.quotes[num1])
                        .font(.custom("KosugiMaru-Regular", size: 30))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("- \(newQuote1.authors[num1])")
                        .font(.custom("KosugiMaru-Regular", size: 25))
                        .fontWeight(.light)
                        .foregroundColor(Color(hex: "787878"))
                    Spacer()
                        .frame(height:60)
                    //CHANGE THE DESTINATION
                    NavigationLink(destination: Homepage()) {
                        Text("start")
                            .foregroundColor(Color.black)
                            .font(.custom("KosugiMaru-Regular", size: 20))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex: "F6EFE8"))
                    .cornerRadius(25)
                    .shadow(radius: 4)
                    .controlSize(.large)
                }
                .padding()
            }//zstack
//            .toolbar {
//                ToolbarItemGroup(placement: .status) {
            //            .padding(10)
            
              //  }//group
            //}//toolbar
        }            .background(Color(hex: "F6EFE8"))

      }
    }
  }
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }
    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue: Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}
