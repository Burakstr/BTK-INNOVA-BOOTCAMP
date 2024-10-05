//
//  Mutfaklar.swift
//  Odev6
//
//  Created by Burak Satır on 30.09.2024.
//

import Foundation

class Mutfaklar {
    var id:Int?
    var ad:String?
    var resim:String?
    init(){
        
    }
    
    init(id: Int, ad: String, resim: String) {
        self.id = id
        self.ad = ad
        self.resim = resim
    }
}
