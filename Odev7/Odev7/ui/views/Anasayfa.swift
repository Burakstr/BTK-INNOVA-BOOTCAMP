//
//  ViewController.swift
//  Odev7
//
//  Created by Burak Satır on 07.10.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var todoTableView: UITableView!
    
    var todoListesi = [Todo]()
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        _ = viewModel.todoListesi.subscribe(onNext: { liste in
            self.todoListesi = liste
            self.todoTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.todolariYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detayGecis" {
            if let todo = sender as? Todo {
                let gidilecekVC = segue.destination as! TodoDetay
                gidilecekVC.todo = todo
            }
        }
    }
}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "todoHucre") as! TodoHucre
        
        let todo = todoListesi[indexPath.row]
        hucre.labelTodoName.text = todo.todo_name
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoListesi[indexPath.row]
        performSegue(withIdentifier: "detayGecis", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let todo = self.todoListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(todo.todo_name!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.viewModel.sil(todo_id: todo.todo_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
