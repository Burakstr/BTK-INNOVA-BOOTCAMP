//
//  TodoKayit.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//


import UIKit

class TodoKayit: UIViewController {
    
    @IBOutlet weak var tfTodoName: UITextField!
    
    var viewModel = TodoKayitViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let todoName = tfTodoName.text, !todoName.isEmpty {
            viewModel.kaydet(todo_name: todoName)
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Please Enter a Task", message: "You need to enter a task before saving.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }

    
}

