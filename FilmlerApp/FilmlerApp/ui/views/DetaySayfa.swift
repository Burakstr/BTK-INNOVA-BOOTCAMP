//
//  DetaySayfa.swift
//  FilmlerApp
//
//  Created by Burak Satır on 29.09.2024.
//

import UIKit

class DetaySayfa: UIViewController {
    
    @IBOutlet weak var labelFilmAd: UILabel!
    @IBOutlet weak var labelFilmFiyat: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = film {
            labelFilmAd.text = f.ad
            labelFilmFiyat.text = "\(f.fiyat!) ₺"
            imageViewFilm.image = UIImage(named: f.resim!)
        }
    }

}
