//
//  SecondViewController.swift
//  Barback
//
//  Created by Harrison Fish on 3/23/20.
//  Copyright © 2020 Harrison Fish. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var possibleIngredients = ["Gin", "Vodka", "Tonic"]
    var myIngredients = [""]
    
    var searchIngredients = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let add = addAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [add])
    }
    
    func addAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Add") { (action, view, completion) in
            self.myIngredients.append(self.possibleIngredients[indexPath.row])
            completion(true)
        }
        action.backgroundColor = .systemGreen
        return action
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchIngredients.count
        } else {
            return possibleIngredients.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = possibleIngredients[indexPath.row]
        if searching {
            cell?.textLabel?.text = searchIngredients[indexPath.row]
        } else {
            cell?.textLabel?.text = possibleIngredients[indexPath.row]
        }
        return cell!
    }
}

extension SecondViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchIngredients = possibleIngredients.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
