//
//  ViewController.swift
//  TabBarKullanimi
//
//  Created by Burak Satır on 21.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabItems = tabBarController?.tabBar.items {
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            
            let rastgeleSayi = Int.random(in: 1...5)
            anasayfaItem.badgeValue = "\(rastgeleSayi)"
            ayarlarItem.badgeValue = numberToWord(rastgeleSayi)
        }
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemIndigo
        
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
    }
    func renkDegistir(itemAppearance:UITabBarItemAppearance){
        //Seçili olan
        itemAppearance.selected.iconColor = UIColor.systemOrange
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
        
        //Seçili olmayan
        itemAppearance.normal.iconColor = UIColor.systemOrange
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        itemAppearance.normal.badgeBackgroundColor = UIColor.lightGray
        
    }
        func numberToWord(_ number: Int) -> String {
            let numberWords = ["Sıfır", "Bir", "İki", "Üç", "Dört", "Beş", "Altı", "Yedi", "Sekiz", "Dokuz", "On"]
            if number >= 0 && number < numberWords.count {
                return numberWords[number]
            }
            return "Bilinmiyor"
        }
    }




