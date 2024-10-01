//
//  ViewController.swift
//  Odev5
//
//  Created by Burak Satır on 25.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentNumber: Int = 0
    var result: Int = 0
    var performingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let tag = sender.tag
        if tag >= 0 && tag <= 9 {
            if performingOperation {
                resultLabel.text = "\(tag)"
                performingOperation = false
            } else {
                resultLabel.text = resultLabel.text == "0" ? "\(tag)" : "\(resultLabel.text!)\(tag)"
            }
            currentNumber = Int(resultLabel.text!) ?? 0
        } else if tag == 11 {
            result += currentNumber
            resultLabel.text = "\(result)"
            performingOperation = true
        } else if tag == 12 {
            result += currentNumber
            resultLabel.text = "\(result)"
            performingOperation = true
        } else if tag == 10 { 
            resultLabel.text = "0"
            currentNumber = 0
            result = 0
            performingOperation = false
        }
    }
}
