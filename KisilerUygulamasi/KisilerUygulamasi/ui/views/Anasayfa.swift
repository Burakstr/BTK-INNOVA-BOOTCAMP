//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Burak Satır on 22.09.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var serachBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var filtre = [Kisiler]()
    var aramaYapiliyorMu = false
    
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serachBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Burak", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet", kisi_tel: "2222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Ahmet", kisi_tel: "3333")
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detayGecis" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            aramaYapiliyorMu = false
        } else {
            aramaYapiliyorMu = true
            let lowercasedSearchText = searchText.lowercased()
            
            if lowercasedSearchText == "artan" {
                
                filtre = kisilerListesi.sorted(by: { $0.kisi_ad! < $1.kisi_ad! })
            } else if lowercasedSearchText == "azalan" {
              
                filtre = kisilerListesi.sorted(by: { $0.kisi_ad! > $1.kisi_ad! })
            } else {
               
                filtre = kisilerListesi.filter { $0.kisi_ad!.lowercased().contains(lowercasedSearchText) }
            }
        }
        kisilerTableView.reloadData()
    }
}

extension Anasayfa:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if aramaYapiliyorMu {
            return filtre.count
        } else {
            return kisilerListesi.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        let kisi: Kisiler
        if aramaYapiliyorMu {
            kisi = filtre[indexPath.row]
        } else {
            kisi = kisilerListesi[indexPath.row]
        }
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi: Kisiler
        if aramaYapiliyorMu {
            kisi = filtre[indexPath.row]
        } else {
            kisi = kisilerListesi[indexPath.row]
        }
        performSegue(withIdentifier: "detayGecis", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let kisi: Kisiler
            if self.aramaYapiliyorMu {
                kisi = self.filtre[indexPath.row]
            } else {
                kisi = self.kisilerListesi[indexPath.row]
            }
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                print("Kişi Sil: \(kisi.kisi_id!)")
                // Kişiyi listeden silme işlemi burada yapılabilir
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
