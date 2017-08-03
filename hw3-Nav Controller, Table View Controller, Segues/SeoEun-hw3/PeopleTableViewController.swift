//
//  PeopleTableViewController.swift
//  SeoEun-hw3
//
//  Created by Eun Susan Seo on 2/10/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {

    //1. empty list of people
    //2. Returns back from createDataModel method and now contains 10 people
    private var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating 10 people
        self.createDataModel()
    }

    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }*/


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //dynamic tableView that counts number of people objects in people list
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 3. Modify the provided UITableViewDataSource methods to:
        //// 1. Indicate 1 section.
        //// 2. Indicate data-model-array count number of rows.
        //// 3. Populate each cell with the first and last name of a person from the data model
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        let person = people[indexPath.row]
        cell.textLabel?.text = person.firstName
        cell.detailTextLabel?.text = person.lastName
        
        return cell
    }



    private func createDataModel () {
        //create 10 person objects and add them to the people
        let firstNameData: [String] = ["Bob", "John", "Led", "Sam", "June", "Allison", "Donald", "Hillary", "Barrack", "Teddy"]
        let lastNameData: [String] = ["Carpenter", "Jones", "Zeppelin", "Sam", "Johnson", "Atwater", "Trump", "Clinton", "Obama", "Roosevelt"]
        let ageData: [Int] = [35, 8, 73, 34, 12, 21, 56, 69, 53, 70]
        let cityData: [String] = ["Austin", "Boston", "Paris", "Sydney","Vienna", "Venice", "Munich", "Brussels", "Tokyo", "Shanghai"]
        
        for i in 0...9 {
            let newPerson = Person(firstName: firstNameData[i], lastName: lastNameData[i], age: ageData[i], city: cityData[i])
            people.append(newPerson)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //helps find proper segue
        if segue.identifier == "personSegue" {
            //we want segue to go to PersonController
            //we want to find the segue destination
           
            //this if let statement is making sure that there is a person view controller that exists
            if let personViewController = segue.destination as? PersonViewController {
                //if person view controller existss, we can specify cell location
                    //indexPathForSelectedRow - see what cell selected
                    //.row = get row #
                
                let indexSelectedRow = tableView.indexPathForSelectedRow?.row
                print(people[indexSelectedRow!])
                
                //assigning specific person object to cell row
                personViewController.person = people[indexSelectedRow!]
                
            }
            
        }
    }

}
