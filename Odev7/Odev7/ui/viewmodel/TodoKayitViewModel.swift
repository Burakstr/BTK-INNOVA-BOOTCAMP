//
//  TodoKayitViewModel.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//


import Foundation

class TodoKayitViewModel {
    var trepo = TodoRepository()
    
    func kaydet(todo_name: String) {
        trepo.kaydet(todo_name: todo_name)
    }
}
