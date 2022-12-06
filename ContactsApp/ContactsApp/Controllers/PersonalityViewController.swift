//
//  PersonalityViewController.swift
//  ContactsApp
//
//  Created by ульяна on 5.12.22.
//

import UIKit

class PersonalityViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var personalityLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
}
extension PersonalityViewController: UITableViewDataSource, UITableViewDelegate  {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = DataService.listOfPeople[indexPath.row]
        
        if indexPath.row % 2 != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
            cell.textLabel?.text = "\(person.email)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
            cell.textLabel?.text = "\(person.phone)"
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        DataService.listOfPeople.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var person = DataService.listOfPeople[section]
        
        let sectionName = NSLocalizedString("\(person.name) \(person.surname)", comment: "mySectionName")
        
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            DataService.listOfPeople.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // Delete the row from the data source
            //        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentContact = DataService.listOfPeople.remove(at: fromIndexPath.row)
        DataService.listOfPeople.insert(currentContact, at: to.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let tableView = view as? UITableViewHeaderFooterView else { return }
                tableView.textLabel?.textColor = UIColor.white
                tableView.contentView.backgroundColor = UIColor.orange
            
    }

}
    

