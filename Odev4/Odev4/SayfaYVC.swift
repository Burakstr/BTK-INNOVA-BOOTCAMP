//
//  SayfaYVC.swift
//  Odev4
//
//  Created by Burak Satır on 24.09.2024.
//

import UIKit

class SayfaYVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonAnasayfa(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
