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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

}
extension ContactsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var person = DataService.listOfPeople[indexPath.row]
        cell.textLabel?.text = "\(person.name) \(person.surname)"
        cell.imageView?.image = UIImage(named: person.name)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataService.listOfPeople.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
}
}
