//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Burak Satır on 22.09.2024.
//

import UIKit

class KisiDetay: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var viewModel = KisiDetayViewModel()
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let k = kisi,let kisi_ad = tfKisiAd.text,let kisi_tel = tfKisiTel.text{
            viewModel.guncelle(kisi_id: k.kisi_id!, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        }
    }
}
