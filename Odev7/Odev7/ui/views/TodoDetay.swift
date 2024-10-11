//
//  TodoDetay.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//

import UIKit

class TodoDetay: UIViewController {
    @IBOutlet weak var tfTodoName: UITextField!
    var viewModel = TodoDetayViewModel()
    
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = todo {
            tfTodoName.text = t.todo_name
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let t = todo, let todo_name = tfTodoName.text {
            viewModel.guncelle(todo_id: t.todo_id!, todo_name: todo_name)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
