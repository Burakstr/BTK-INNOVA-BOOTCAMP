//
//  ViewController.swift
//  UserDefaultKullanimi
//
//  Created by Burak Satır on 29.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let ud = UserDefaults.standard
        
        //Silme
        ud.removeObject(forKey: "sayac")
        
        //Okuma
        var sayac = ud.integer(forKey: "sayac")//Varsayılan Değeri 0
        
        sayac = sayac + 1
        
        //Kayıt
        ud.set(sayac, forKey: "sayac")
        
        labelSonuc.text = String(sayac)
        
    }


}

