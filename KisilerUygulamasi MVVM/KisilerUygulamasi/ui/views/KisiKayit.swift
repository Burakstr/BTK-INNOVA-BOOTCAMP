//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Burak Satır on 22.09.2024.
//

import UIKit

class KisiKayit: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var viewModel = KisiKayitViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonKaydet(_ sender: Any) {
        if let kisi_ad = tfKisiAd.text,let kisi_tel = tfKisiTel.text {
            viewModel.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        }
    }
}
