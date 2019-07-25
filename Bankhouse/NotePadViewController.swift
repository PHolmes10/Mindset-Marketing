//
//  NotePadViewController.swift
//  Bankhouse
//
//  Created by Patrick Holmes on 7/24/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class NotePadViewController: UITableViewController {

    let itemArray = ["one", "two", "three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        cell.backgroundColor = UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        
        cell.textLabel?.textColor = UIColor(red: 241.0/255.0, green: 187.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Notes
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
}
