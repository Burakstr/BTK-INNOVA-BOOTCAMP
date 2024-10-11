//
//  TodoRepository.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//

import Foundation
import RxSwift

class TodoRepository {
    
    var todoListesi = BehaviorSubject<[Todo]>(value: [Todo]())
    var db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("task.db")
        db = FMDatabase(path: veritabaniURL.path())
    }
    
    func kaydet(todo_name: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO toDos (todo_name) VALUES (?)", values: [todo_name])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(todo_id: Int, todo_name: String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE toDos SET todo_name = ? WHERE todo_id = ?", values: [todo_name, todo_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(todo_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM toDos WHERE todo_id = ?", values: [todo_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi: String) {
        db?.open()
        do {
            var liste = [Todo]()
            let rs = try db!.executeQuery("SELECT * FROM toDos WHERE todo_name like '%\(aramaKelimesi)%'", values: nil)
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id"))
                let todo_name = rs.string(forColumn: "todo_name")
                
                let todo = Todo(todo_id: todo_id!, todo_name: todo_name!)
                liste.append(todo)
            }
            todoListesi.onNext(liste) // Tetikleme
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func todolariYukle() {
        db?.open()
        do {
            var liste = [Todo]()
            let rs = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id"))
                let todo_name = rs.string(forColumn: "todo_name")
                
                let todo = Todo(todo_id: todo_id!, todo_name: todo_name!)
                liste.append(todo)
            }
            todoListesi.onNext(liste) // Tetikleme
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
