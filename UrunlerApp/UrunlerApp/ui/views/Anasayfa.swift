//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Burak Satır on 28.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        let u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar", fiyat: 78000)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 6500)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 12300)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 6499)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 11400)
        let u6 = Urunler(id: 6, ad: "Dyson V12", resim: "supurge", fiyat: 12700)
        let u7 = Urunler(id: 1, ad: "IPhone 13", resim: "telefon", fiyat: 45000)
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        urunlerTableView.separatorColor = UIColor(named: "arkaplanRenk")
    }
}

extension Anasayfa: UITableViewDelegate,UITableViewDataSource,HucreProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        let urun = urunlerListesi[indexPath.row]
        
        hucre.imageViewUrun.image = UIImage(named: urun.resim!)
        hucre.labelUrunAd.text = urun.ad
        hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
        
        hucre.backgroundColor = UIColor(named: "arkaplanRenk")
        hucre.hucreArkaplan.layer.cornerRadius = 10.0
        
        hucre.selectionStyle = .none
        
        hucre.indexPath = indexPath
        hucre.hucreProtocol = self
        
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let urun = sender as? Urunler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.urun = urun
            }
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {contextualAction,view,bool in
            print("\(urun.ad!) silindi")
        }
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") {contextualAction,view,bool in
            print("\(urun.ad!) duzenlendi")
        }
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("Anasayfa: \(urun.ad!) sepete eklendi")
    }
}



//Filitreleme buttonu koy
