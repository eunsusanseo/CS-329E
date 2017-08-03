//
//  Person.swift
//  SeoEun-hw3
//
//  Created by Eun Susan Seo on 2/10/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import Foundation

//When a specific table view cell is selected, this clas will be set to appropriate person object via prepareForSegue method

class Person {
    // name: firstName, type: optional String (?)
    var firstName: String?
    
    // name: lastName, type: optional String
    var lastName: String?
    
    // name: age, type: optional Int
    var age: Int?
    
    // name: city, type: optional String
    var city: String?
    
    //add init method with arguments for all the attributes, and initialize them with the values passed
    init(firstName: String, lastName: String, age: Int, city: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.city = city
    }
}

