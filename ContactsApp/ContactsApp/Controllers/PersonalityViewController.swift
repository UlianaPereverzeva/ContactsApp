//
//  PersonalityViewController.swift
//  ContactsApp
//
//  Created by ульяна on 5.12.22.
//

import UIKit

class PersonalityViewController: UIViewController {

    @IBOutlet weak var personalityLbl: UITabBarItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }
}
extension PersonalityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        var person = DataService.listOfPeople[indexPath.row]
        cell.textLabel?.text = "\(person.name) \(person.surname)"
        cell.imageView?.image = UIImage(named: person.name)
        
        return cell
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
         DataService.listOfPeople.count
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
}
    

