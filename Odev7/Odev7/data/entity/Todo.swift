//
//  Todo.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//

import Foundation

class Todo {
    var todo_id: Int?
    var todo_name: String?
    
    init(todo_id: Int, todo_name: String) {
        self.todo_id = todo_id
        self.todo_name = todo_name
    }
}
