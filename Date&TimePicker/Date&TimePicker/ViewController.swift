//
//  ViewController.swift
//  Date&TimePicker
//
//  Created by Burak Satır on 22.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfSaat: UITextField!
    @IBOutlet weak var tfTarih: UITextField!
    
    var timePicker:UIDatePicker?
    var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        if #available(iOS 13.4, *) {
            timePicker?.preferredDatePickerStyle = .wheels
            datePicker?.preferredDatePickerStyle = .wheels
        }
        
        
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunma))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker:)), for: .valueChanged)
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
    }
    
    @objc func dokunma(){
        print("Ekrana tıklanıldı.")
        view.endEditing(true)
    }
    
    @objc func saatGoster(uiDatePicker:UIDatePicker) {
        let saatFormat = DateFormatter()
        saatFormat.dateFormat = "HH:mm a"
        let alinanSaat = saatFormat.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }
    
    @objc func tarihGoster(uiDatePicker:UIDatePicker) {
        let tarihFormat = DateFormatter()
        tarihFormat.dateFormat = "EEEE, MMM d, yyyy"
        let alinanTarih = tarihFormat.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    
    
}

