//
//  SayfaBVC.swift
//  Odev4
//
//  Created by Burak Satır on 24.09.2024.
//

import UIKit

class SayfaBVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonSayfaY(_ sender: Any) {
        performSegue(withIdentifier: "sayfaYGecis", sender: nil)
    }
}
