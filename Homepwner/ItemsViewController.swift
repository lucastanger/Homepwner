//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Luca Stanger on 23.03.20.
//  Copyright © 2020 Luca Stanger. All rights reserved.
//

//import Foundation
import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
//        // Make a new index path for the 0th section, last row
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//
//        // Insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create an instance of UITableViewCell, with default apperance
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        // Set the text on the cell with the description of the item that is at the
        // nth index, where n = row this cell will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
}
