//
//  JournalItem.swift
//  RevvIT
//
//  Created by Scholar on 7/21/23.
//

import Foundation

class JournalItem: Identifiable {
    
    var text : String
    var important : Bool
    var id = UUID()
    
    init(text: String, important:Bool = false){
        self.text = text
        self.important = important
    }
}
