//
//  ContactsViewController.swift
//  ContactsApp
//
//  Created by ульяна on 5.12.22.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var contactsLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var people = DataService.listOfPeople
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

}
extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let person = people[indexPath.row]
        
        cell.textLabel?.text = "\(person.name) \(person.surname)"
        cell.imageView?.image = UIImage(named: person.name)

        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "InfoAboutPersonViewController") as? InfoAboutPersonViewController else { return }
        
        vc.personData = people[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
         if editingStyle == .delete {
             people.remove(at: indexPath.row)
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
        let currentContact = people.remove(at: fromIndexPath.row)
        people.insert(currentContact, at: to.row)
    }
}
