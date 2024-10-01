//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Burak Satır on 22.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textFieldGirdi: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelSwitch: UILabel!
    @IBOutlet weak var mSwitch: UISwitch!
    @IBOutlet weak var labelSegmented: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelStepper: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSwitch.text = ""
        labelSegmented.text = "Kategori Seciniz"
        labelSlider.text = String(Int(slider.value))
        labelStepper.text = String(Int(stepper.value))
        indicator.isHidden = true
        
        
        
    }
    
    @IBAction func buttonOku(_ sender: Any) {
        
        if let alinanVeri = textFieldGirdi.text {
            labelSonuc.text = alinanVeri
        }
    }
    
    @IBAction func buttonResim1(_ sender: Any) {
        imageView.image = UIImage(named: "resim1")
    }
    
    
    @IBAction func buttonResim2(_ sender: Any) {
        imageView.image = UIImage(named: "resim2")
    }
    
    @IBAction func switchDegisim(_ sender: UISwitch) {
        if sender.isOn {
            labelSwitch.text = "ON"
        }else{
            labelSwitch.text = "OFF"
        }
    }
    
    @IBAction func segmentedDegisim(_ sender: UISegmentedControl) {
        let secilenIndeks = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndeks)
        labelSegmented.text = secilenKategori
    }
    
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value))
        
        
        //0-20 : Az
        if slider.value < 20 {
            labelSlider.text = "\(String(Int(slider.value))) : Az"
        }
        //21 - 80 : Orta
        if slider.value >= 21 || slider.value <= 80 {
            labelSlider.text = "\(String(Int(slider.value))) : Orta"
        }
        //81 - 100 : Cok
        if slider.value >= 81 && slider.value <= 100 {
            labelSlider.text = "\(String(Int(slider.value))) : Çok"
        }
    }
    
    @IBAction func stepperDegisim(_ sender: UIStepper) {
        labelStepper.text = String(Int(sender.value))
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    
    @IBAction func buttonDur(_ sender: Any) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    
    
    @IBAction func buttonGoster(_ sender: Any) {
        print("Switch Durum : \(mSwitch.isOn)")
        let secilenIndeks = segmentedControl.selectedSegmentIndex
        let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
        print("Segmented Durum : \(secilenKategori!)")
        print("Slider Durum : \(slider.value)")
        print("Stepper Durum : \(stepper.value)")
        
    }
    
    
    @IBAction func buttonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            print("İptal Seçildi")
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) { action in
            print("Tamam Seçildi")
        }
        alertController.addAction(tamamAction)
        
        self.present(alertController,animated: true)
    }
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            print("İptal Seçildi")
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) { action in
            print("Tamam Seçildi")
        }
        alertController.addAction(tamamAction)
        
        self.present(alertController,animated: true)
    }
    
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Login", message: "Giriş Yapınız", preferredStyle: .alert)
        
        alertController.addTextField { textfield in
            textfield.placeholder = "E-mail"
            textfield.keyboardType = .emailAddress
        }
        
        alertController.addTextField { textfield in
            textfield.placeholder = "Şifre"
            textfield.keyboardType = .numberPad
            textfield.isSecureTextEntry = true
                
        }
        
        let girisAction = UIAlertAction(title: "Giriş", style: .cancel) { action in
            let tfEmail = alertController.textFields![0] as UITextField
            let tfSifre = alertController.textFields![1] as UITextField
            
            if let email = tfEmail.text, let sifre = tfSifre.text {
                print("Email : \(email) - Şifre : \(sifre)")
            }
        }
        alertController.addAction(girisAction)
        
        self.present(alertController,animated: true)
    }
    
}


