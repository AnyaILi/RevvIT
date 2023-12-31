//
//  ToDoItem.swift
//  RevvIT
//
//  Created by Scholar on 7/20/23.
//

import Foundation

class ToDoItem: Identifiable {
    
    var title : String
    var isImportant : Bool
    var id = UUID()
    
    init(title: String, isImportant:Bool = false){
        self.title = title
        self.isImportant = isImportant
    }
}

