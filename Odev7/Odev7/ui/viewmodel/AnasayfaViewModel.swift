//
//  AnasayfaViewModel.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//


import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var trepo = TodoRepository()
    var todoListesi = BehaviorSubject<[Todo]>(value: [Todo]())
    
    init() {
        veritabaniKopyala()
        todolariYukle()
        todoListesi = trepo.todoListesi
    }
    
    func sil(todo_id: Int) {
        trepo.sil(todo_id: todo_id)
        todolariYukle()
    }
    
    func ara(aramaKelimesi: String) {
        trepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func todolariYukle() {
        trepo.todolariYukle()
    }
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "task", ofType: ".db")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("task.db")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
