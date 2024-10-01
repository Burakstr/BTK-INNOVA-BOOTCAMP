//
//  Filmler.swift
//  CalismaYapisi
//
//  Created by Burak Satır on 21.09.2024.
//

import Foundation

class Filmler {
    var id:Int?
    var ad:String?
    var kategori:String?
    var yonetmen:String?
    var fiyat:Int?
    
    init(id: Int, ad: String, kategori: String, yonetmen: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.kategori = kategori
        self.yonetmen = yonetmen
        self.fiyat = fiyat
    }
}


