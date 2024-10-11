//
//  TodoDetayViewModel.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//


import Foundation

class TodoDetayViewModel {
    var trepo = TodoRepository()
    
    func guncelle(todo_id: Int, todo_name: String) {
        trepo.guncelle(todo_id: todo_id, todo_name: todo_name)
    }
}
