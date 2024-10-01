//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Burak Satır on 29.09.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var sonuc = BehaviorSubject<String>(value: "0")
    var mrepo = MatematikRepository()
    
    init(){
        sonuc = mrepo.sonuc
    }
    
    func topla(alinanSayi1:String,alinanSayi2:String){
        mrepo.topla(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    func carpma(alinanSayi1:String,alinanSayi2:String){
        mrepo.carpma(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
}
