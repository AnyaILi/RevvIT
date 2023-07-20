//
//  quote.swift
//  RevvIT
//
//  Created by Scholar on 7/20/23.
//

import UIKit

class quote: NSObject {
    var quotes = ["It always seems impossible until it's done.", "It does not matter how slowly you go as long as you do not stop." , "Do one thing that scares you everyday.", "Each day comes bearing its gifts. Untie the ribbon.", "Living is the art of getting used to what we didn't expect.", "Kindness is one thing you can't give away. It always comes back", "Life is 10% what happens to you and 90% how you react to it.", "Success is liking yourself, liking what you do, and likeing how you do it.", "Success only comes to those who dare to attempt.", "You are your best thing."]
    var authors = ["Nelson Mandela", "Confucius", "Eleanor Roosevelt", "Ann Ruth Schabacker", "Eleanor C. Wood", "George Skolsky", "Charles R.", "Maya Angelou", "Mallika Tripathi", "Toni Morrison"]
    var randomNum = 0
    var quoteA = ""
    var authorsA = ""
    
//    func randQA() -> String{
//        randomNum = Int.random(in: 0 ..< quotes.count)
//        quoteA = quotes[randomNum]
//        authorsA = authors[randomNum]
//        return "\"" + quoteA + authorsA + "\""
//    }
    
    func randNum() -> Int {
        randomNum = Int.random(in: 0 ..< quotes.count)
        return randomNum
    }
    
   

}
