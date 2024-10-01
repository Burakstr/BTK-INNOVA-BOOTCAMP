//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Burak Satır on 29.09.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var krepo = KisilerRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init(){
        kisileriYukle()
        kisilerListesi = krepo.kisilerListesi
    }
    func sil(kisi_id:Int){
        krepo.sil(kisi_id: kisi_id)
        kisileriYukle()
    }
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func kisileriYukle(){
        krepo.kisileriYukle()
    }
}

