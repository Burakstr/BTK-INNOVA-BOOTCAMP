//
//  SayfaXVC.swift
//  Odev4
//
//  Created by Burak Satır on 24.09.2024.
//

import UIKit

class SayfaXVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonSayfaY(_ sender: Any) {
        performSegue(withIdentifier: "sayfaYGecis", sender: nil)
    }
}
