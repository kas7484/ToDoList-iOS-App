//
//  ViewController.swift
//  TODO
//
//  Created by Krish Shah on 6/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataItems = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            dataItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataItems[indexPath.row]
        return cell!
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFields = UITextField()
        
        let alert = UIAlertController(title: "Add Item", message: nil , preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alert.addAction(UIAlertAction(title: "Add Item", style: .default, handler: { _ in
            self.dataItems.append(textFields.text!)
            self.tableView.reloadData()
        }))
        alert.addTextField{ (textField) in
            textField.placeholder = "Add items on your ToDo list"
            textFields = textField
        }
        
        present(alert, animated: true)
        
    }
}

