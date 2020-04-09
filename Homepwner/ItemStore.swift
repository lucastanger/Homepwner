//
//  ItemStore.swift
//  Homepwner
//
//  Created by Luca Stanger on 23.03.20.
//  Copyright © 2020 Luca Stanger. All rights reserved.
//

//import Foundation
import UIKit

class ItemStore {
    var allItems = [Item]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    init() {
        typealias allItemsType = [Item]?
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let decoder = PropertyListDecoder()
            if let allItems = try decoder.decode(allItemsType.self, from: data) {
                self.allItems = allItems
            }
            print("Successfully loaded all items")
        } catch {
            print("itemStore init error: \(error)")
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    func saveChanges() -> Bool {
        print("Saving items to \(itemArchiveURL.path)")
        do {
            let data = try PropertyListEncoder().encode(allItems)
            try data.write(to: itemArchiveURL)
            return true
        } catch {
            print("Error saving items: \(error)")
        }
        return false
    }
}
