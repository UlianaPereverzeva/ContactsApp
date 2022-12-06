//
//  DataService.swift
//  ContactsApp
//
//  Created by ульяна on 5.12.22.
//

import Foundation

class DataService {
    static var listOfPeople = DataService.makePeople(numberOfPeople: 10)
    
    private static let arrayOfNames = ["Uliana", "Alesya", "Masha", "Dasha", "Lena", "Sasha", "Margo", "Veronika", "Alina", "Julia"]
    private static let arrayOfSurnames = ["Pereverzeva", "Mitrofanova", "Miheeva", "Vilova", "Salieva", "Brankevich", "Baranova", "Lukianova", "Solovey", "Mortinovna"]
    
    private static func makePeople(numberOfPeople: Int) -> [Person] {
        var result = [Person]()
        for _ in 1...numberOfPeople {
            result.append(uniquePerson(peopleWhichAlreadyExist: result))
        }
        return result
    }
    
    private static func uniquePerson(peopleWhichAlreadyExist: [Person]) -> Person {
        var randomName: String = arrayOfNames.randomElement() ?? ""
        while peopleWhichAlreadyExist.contains(where: { $0.name == randomName }) {
            randomName = arrayOfNames.randomElement() ?? ""
        }
        var randomSurname: String = arrayOfSurnames.randomElement() ?? ""
        while peopleWhichAlreadyExist.contains(where: { $0.surname == randomSurname }) {
            randomSurname = arrayOfSurnames.randomElement() ?? ""
        }
        let newPerson = Person(name: randomName, surname: randomSurname)

        return newPerson
    }
}
