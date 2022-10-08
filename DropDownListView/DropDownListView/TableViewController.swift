//
//  ViewController.swift
//  DropDownListView
//
//  Created by Garret Kielburger on 2021-09-30.
//

import UIKit

class TableViewController: UITableViewController {

    // MARK: Properties
    struct FirstLevelItem {
        var title = String()
        var secondLevelItems = [String]()
        var isOpen = Bool()
    }

    var allItems = [FirstLevelItem]()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondLevelItemsGeneric = ["This is the first item", "This is the second item", "this is the third item"]
        
        let firstLevelItem1 = FirstLevelItem(title: "Item the First", secondLevelItems: secondLevelItemsGeneric, isOpen: false)
        
        let firstLevelItem2 = FirstLevelItem(title: "Item the Second", secondLevelItems: secondLevelItemsGeneric, isOpen: false)
        
        let firstLevelItem3 = FirstLevelItem(title: "Item the Final", secondLevelItems: secondLevelItemsGeneric, isOpen: false)
        
        allItems = [firstLevelItem1, firstLevelItem2, firstLevelItem3]
        
    }

    // MARK: - TableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allItems.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allItems[section].isOpen == true {
            return allItems[section].cells.count + 1 // Plus one to account for the first drop-down cell
        } else {
            return 1 // This is the section cell containing the others
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = allItems[indexPath.section].title
            return cell
        } else {
            // Use a custom class cell with its unique identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = allItems[indexPath.section].cells[indexPath.row - 1] // Subract one because we have cells in total (including the section cell) but only three elements as section
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { // To prevent closing the dropdown when touching child cells
            if allItems[indexPath.section].isOpen == true {
                allItems[indexPath.section].isOpen = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
            } else {
                allItems[indexPath.section].isOpen = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
            }
        }
    }

}

