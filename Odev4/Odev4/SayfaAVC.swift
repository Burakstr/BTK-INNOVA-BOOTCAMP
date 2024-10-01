//
//  SayfaAVC.swift
//  Odev4
//
//  Created by Burak Satır on 24.09.2024.
//

import UIKit

class SayfaAVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonSayfaB(_ sender: Any) {
        performSegue(withIdentifier: "sayfaBGecis", sender: nil)
    }
}
