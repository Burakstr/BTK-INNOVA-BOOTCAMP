//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Burak Satır on 21.09.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var labelAnasayfa: UILabel!
    
    var sayac = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelAnasayfa.text = "Sayaç Sıfır"
        print("Anasayfa : viewDidLoad çalıştı") // Bir kere çalışır
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfa : viewWillAppear çalıştı")
        //Sayfa her göründüğünde çalışır
        //Bulundugu sayfaya geri döüldügünü algılayabiliriz.
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Anasayfa : viewWillDisappear çalıştı")
        //Sayfa her görünmez olduğunda çalışır
    }

    @IBAction func buttonTikla(_ sender: Any) {
        sayac = sayac + 1
        labelAnasayfa.text = "Sayaç : \(sayac)"
        
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        let film = Filmler(id: 1, ad: "Interstellar", kategori: "Bilim Kurgu", yonetmen: "C.Nolan", fiyat: 78)
        performSegue(withIdentifier: "oyunEkraniGecis", sender: film)
        
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Anasayfa : prepare çalıştı")
        
        if segue.identifier == "oyunEkraniGecis" {
            print("Anasayfa : oyunEkraniGecis çalıştı")
            
            if let veri = sender as? Filmler {//as?,as! Downcasting
                
                let gidilecekVC = segue.destination as! OyunEkrani
                gidilecekVC.sonuc = veri
            }
        }
    }
    @IBAction func buttonSil(_ sender: Any) {
        print("Sil Tıklandı")
    }
}

//eğer 0(sayısal) gönderilirse , oyun ekranı başlıgında 0 yazıcak ve back tuşu gorunmez olucak
//eğer 1(sayısal) gönderilirse , oyun ekranı başlıgında 0 yazıcak ve back tuşu gorunmez olucak
