//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Burak Satır on 29.09.2024.
//

import Foundation

class KisiKayitViewModel {
    var krepo = KisilerRepository()
    func kaydet(kisi_ad:String,kisi_tel:String){
        krepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
}
