//
//  ViewController.swift
//  Odev6
//
//  Created by Burak Satır on 30.09.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var kampanyalarCollectionView: UICollectionView!
    @IBOutlet weak var mutfakTumunuGorLabel: UILabel!
    @IBOutlet weak var mutfaklarLabel: UILabel!
    @IBOutlet weak var mutfaklarCollectionView: UICollectionView!
    @IBOutlet weak var kampanyaTumunuGorLabel: UILabel!
    @IBOutlet weak var kampanyalarLabel: UILabel!
    var kampanyalarListesi = [Kampanyalar]()
    var mutfaklarListesi = [Mutfaklar]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mutfaklarCollectionView.delegate = self
        mutfaklarCollectionView.dataSource = self
        kampanyalarCollectionView.delegate = self
        kampanyalarCollectionView.dataSource = self
        
        let m1 = Mutfaklar(id: 1, ad: "Hamburger", resim: "hamburger")
        let m2 = Mutfaklar(id: 2, ad: "Döner", resim: "doner")
        let m3 = Mutfaklar(id: 3, ad: "Lahmacun", resim: "lahmacun")
        let m4 = Mutfaklar(id: 4, ad: "Pastane & Fırın", resim: "pastane")
        let m5 = Mutfaklar(id: 5, ad: "Pizza", resim: "pizza")
        let m6 = Mutfaklar(id: 6, ad: "Tost", resim: "tost")
        let m7 = Mutfaklar(id: 7, ad: "Tatli", resim: "tatli")
        let m8 = Mutfaklar(id: 8, ad: "Çiğ Köfte", resim: "cigkofte")
        let m9 = Mutfaklar(id: 9, ad: "Pilav", resim: "pilav")
        let m10 = Mutfaklar(id: 10, ad: "Börek", resim: "borek")
        let m11 = Mutfaklar(id: 11, ad: "Kebap", resim: "kebap")
        let m12 = Mutfaklar(id: 12, ad: "Salata", resim: "salata")
        let m13 = Mutfaklar(id: 13, ad: "Kahve", resim: "kahve")
        let m14 = Mutfaklar(id: 14, ad: "Köfte", resim: "kofte")
        let m15 = Mutfaklar(id: 15, ad: "Steak", resim: "steak")
        mutfaklarListesi.append(m1)
        mutfaklarListesi.append(m2)
        mutfaklarListesi.append(m3)
        mutfaklarListesi.append(m4)
        mutfaklarListesi.append(m5)
        mutfaklarListesi.append(m6)
        mutfaklarListesi.append(m7)
        mutfaklarListesi.append(m8)
        mutfaklarListesi.append(m9)
        mutfaklarListesi.append(m10)
        mutfaklarListesi.append(m11)
        mutfaklarListesi.append(m12)
        mutfaklarListesi.append(m13)
        mutfaklarListesi.append(m14)
        mutfaklarListesi.append(m15)
        
        let k1 = Kampanyalar(id: 1, resim: "trendyol1")
        let k2 = Kampanyalar(id: 2, resim: "trendyol2")
        let k3 = Kampanyalar(id: 3, resim: "trendyol3")
        let k4 = Kampanyalar(id: 4, resim: "trendyol4")
        let k5 = Kampanyalar(id: 5, resim: "trendyol5")
        let k6 = Kampanyalar(id: 6, resim: "trendyol6")
        kampanyalarListesi.append(k1)
        kampanyalarListesi.append(k2)
        kampanyalarListesi.append(k3)
        kampanyalarListesi.append(k4)
        kampanyalarListesi.append(k5)
        kampanyalarListesi.append(k6)
        
        //Kampanya Tasarim
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        tasarim.minimumInteritemSpacing = 2
        tasarim.minimumLineSpacing = 2
        tasarim.scrollDirection = .horizontal
        
        let ekranGenislik = UIScreen.main.bounds.width
        let ekranYukseklik = UIScreen.main.bounds.height
        
        // Hücre genişliği ekranın tamamını kaplasın
        let itemGenislik = ekranGenislik
        let itemYukseklik = ekranYukseklik * 0.15 // Ekranın %60'ını kaplayacak şekilde ayarlanıyor (örneğin)
        
        // Hücrelerin boyutunu ayarlıyoruz (tam ekran genişliği ve yüksekliği)
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemYukseklik)
        kampanyalarCollectionView.collectionViewLayout = tasarim
        
        // Tab bar'da kampanyalar item'ine badge ekliyoruz
        if let tabItems = tabBarController?.tabBar.items {
            let kampanyalarItem = tabItems[4]
            kampanyalarItem.badgeValue = "3"
        }
        
        let tasarimMutfak = UICollectionViewFlowLayout()
        tasarimMutfak.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tasarimMutfak.minimumInteritemSpacing = 6
        tasarimMutfak.minimumLineSpacing = 6
        
        //10X10X10X10X10
        let ekranGenislik2 = UIScreen.main.bounds.width
        let itemGenislik2 = (ekranGenislik2 - 50) / 4
        
        tasarimMutfak.itemSize = CGSize(width: itemGenislik2, height: itemGenislik2*1.2)
        mutfaklarCollectionView.collectionViewLayout = tasarimMutfak
        
        // Tab bar görünümünü ayarlıyoruz
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white
        renkDegistir(itemApperance: appearance.stackedLayoutAppearance)
        renkDegistir(itemApperance: appearance.inlineLayoutAppearance)
        renkDegistir(itemApperance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        // Search bar içindeki placeholder ve büyüteç ikonunu ayarlıyoruz
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            // Placeholder metnini küçültüyoruz
            searchTextField.attributedPlaceholder = NSAttributedString(
                string: "Restoran, ürün veya mutfak ara",
                attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
            )
            
            // Büyüteç simgesini turuncu yapıyoruz
            if let imageView = searchTextField.leftView as? UIImageView {
                imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = .orange // Turuncu renk
            }
        }
    }
    
    // Tab bar item'larının seçili ve seçili olmayan durumlarının renklerini ayarlıyoruz
    func renkDegistir(itemApperance: UITabBarItemAppearance) {
        // Seçili durum
        itemApperance.selected.iconColor = UIColor.systemOrange
        itemApperance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        itemApperance.selected.badgeBackgroundColor = UIColor.systemOrange
        // Seçili olmayan durum
        itemApperance.normal.badgeBackgroundColor = UIColor.systemOrange
    }
    
    @IBAction func filtreButton(_ sender: Any) {
    }
    
}

extension Anasayfa : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == kampanyalarCollectionView {
            return kampanyalarListesi.count
        }else if collectionView == mutfaklarCollectionView {
            return mutfaklarListesi.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == kampanyalarCollectionView {
            let kampanya = kampanyalarListesi[indexPath.row]
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "kampanyalarHucre", for: indexPath) as! KampanyalarHucre
            
            hucre.imageViewKampanya.image = UIImage(named: kampanya.resim!)
            hucre.layer.cornerRadius = 10
            return hucre
        } else if collectionView == mutfaklarCollectionView {
            let mutfak = mutfaklarListesi[indexPath.row]
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "mutfaklarHucre", for: indexPath) as! MutfaklarHucre
            hucre.imageViewMutfak.image = UIImage(named: mutfak.resim!)
            hucre.labelMutfak.text = "\(mutfak.ad!)"
            hucre.layer.borderColor = UIColor.lightGray.cgColor
            hucre.layer.borderWidth = 0.3
            hucre.backgroundColor = UIColor.white
            hucre.layer.cornerRadius = 10
            return hucre
        }
        return UICollectionViewCell()
    }
}

