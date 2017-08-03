//
//  ContactTableViewController.swift
//  SeoEun-hw4
//
//  Created by Eun Susan Seo on 2/19/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createDataModel()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = people[Int(indexPath.section)]
        //let person = people[Int(indexPath.row/2)]
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "namecellid", for: indexPath) as! NameTableViewCell

            cell.firstNameLbl.text = person.firstName!
            cell.lastNameLbl.text = person.lastName!
            cell.person = person
            cell.vc = self
            
            return cell
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addresscellid", for: indexPath) as! AddressTableViewCell
            
            let person = people[indexPath.section]
            
            cell.streetLbl?.text = person.street
            cell.cityLbl?.text = person.city
            cell.stateLbl?.text = person.state
            cell.zipLbl?.text = "\((person.zip)!)"
            
            return cell
        }
    }

    
    
    func createDataModel () {
        //create a data model with at least 9 person objects which will be used to populate table view cells
        let firstNameData: [String] = ["Joe", "Sam", "Sue", "Zoey", "Alan", "Chris", "Danny", "Eli", "Frank"]
        let lastNameData: [String] = ["Johnson", "Smith", "Jefferson", "Zimmerman", "Albright", "Chambers", "Donaldson", "Edgerton", "Farmer"]
        let ageData: [Int] = [35, 27, 52, 17, 83, 33, 6, 10, 100]
        let streetData: [String] = ["1 Main Street", "2 Main Street", "3 Main Street", "4 Main Street","5 Main Street", "6 Main Street", "7 Main Street", "8 Main Street", "9 Main Street"]
        let cityData: [String] = ["Austin", "Marble Falls", "Houston", "San Antonio", "Dallas", "Round Rock", "Cedar Park", "Leander", "Webster"]
        let stateData: [String] = ["TX", "TX", "TX", "TX", "TX", "TX", "TX", "TX", "TX"]
        let zipData: [Int] = [78128, 78228, 78328, 78428, 78528, 78628, 78728, 78828, 78928]
        
        for i in 0...8 {
            let newPerson = Person(firstName: firstNameData[i], lastName: lastNameData[i], age: ageData[i], street: streetData[i], city: cityData[i], state: stateData[i], zip: zipData[i])
            people.append(newPerson)
        }
    }

}
