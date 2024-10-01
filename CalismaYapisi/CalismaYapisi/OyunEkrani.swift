//
//  OyunEkrani.swift
//  CalismaYapisi
//
//  Created by Burak Satır on 21.09.2024.
//

import UIKit

class OyunEkrani: UIViewController {
    
    @IBOutlet weak var labelOyunEkrani: UILabel!
    
    @IBOutlet weak var labelSonuc: UILabel!
    var sonuc:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let s = sonuc {
            labelSonuc.text = "\(s.id!) - \(s.ad!) - \(s.kategori!) - \(s.yonetmen!) - \(s.fiyat!) ₺"
        }
        
        /*  self.navigationItem.hidesBackButton = true
        //IOS görünürlük kodları hide
        //Androind görünürlük kodları visibility
        
        //Back stack : Bir sayfayı görürken arkada başka bir sayfanın beklemesi
        if let m = mesaj {
            self.navigationItem.title = String(m)
            if m == 0 {
                self.navigationItem.hidesBackButton = true
            }
            if m == 1 {
                self.navigationItem.hidesBackButton = false
            }

            
            
        } */

    }
    
    @IBAction func buttonGeri(_ sender: Any) {
        //Bir önceki sayfaya döner
        //navigationController?.popViewController(animated: true)
        //İlk sayfaya döner
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraniGecis", sender: nil)
    }
    
}
