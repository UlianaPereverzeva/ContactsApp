//
//  PersonInfo.swift
//  ContactsApp
//
//  Created by ульяна on 5.12.22.
//

import Foundation

struct Person {
    
   private var arrayOfNames = ["Uliana", "Alesya", "Masha", "Dasha", "Lena", "Sasha", "Margo", "Veronika", "Alina", "Julia"]
    private var arrayOfSurnames = ["Pereverzeva", "Mitrofanova", "Miheeva", "Vilova", "Salieva", "Brankevich", "Baranova", "Lukianova", "Solovey", "Mortinovna"]
    
    lazy var name: String = arrayOfNames.randomElement() ?? ""
    lazy var surname: String = arrayOfSurnames.randomElement() ?? ""
    var email = "weloveu44@gmail.com"
    var phone = "+375 (29) 777 88 99"
    
      

}


