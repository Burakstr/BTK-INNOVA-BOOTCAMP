//
//  ViewController.swift
//  MVVMKullanimi
//
//  Created by Burak Satır on 29.09.2024.
//

import UIKit
import RxSwift

class Anasayfa: UIViewController {
    
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var tfSayi1: UITextField!
    @IBOutlet weak var tfSayi2: UITextField!
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Gözlem,Okuma işlemi,dinleme
        _ = viewModel.sonuc.subscribe(onNext: {s in
            self.labelSonuc.text = s
        })
    }
    
    @IBAction func buttonToplama(_ sender: Any) {
        if let alinanSayi1 = tfSayi1.text,
           let alinanSayi2 = tfSayi2.text {
            viewModel.topla(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
            
        }
    }
    
    @IBAction func buttonCarpma(_ sender: Any) {
        if let alinanSayi1 = tfSayi1.text,
           let alinanSayi2 = tfSayi2.text {
            viewModel.carpma(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
        
    }
}
