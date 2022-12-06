//
//  InfoAboutPersonViewController.swift
//  ContactsApp
//
//  Created by ульяна on 5.12.22.
//

import UIKit

class InfoAboutPersonViewController: UIViewController {

    @IBOutlet weak var imageOfPerson: UIImageView!
    @IBOutlet weak var nameSurnameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    var personData: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = personData?.name
        nameSurnameLbl.text = "\(personData?.name ?? "") \(personData?.surname ?? "")"
        imageOfPerson.image = UIImage(named: personData?.name ?? "")
        phoneLbl.text = personData?.phone
        emailLbl.text = personData?.email
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
