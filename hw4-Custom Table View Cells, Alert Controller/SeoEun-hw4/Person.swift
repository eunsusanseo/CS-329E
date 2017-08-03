//
//  Person.swift
//  SeoEun-hw4
//
//  Created by Eun Susan Seo on 2/18/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import Foundation

class Person {
    //declare public attributes
    public var firstName : String?
    public var lastName : String?
    public var age : Int?
    public var street : String?
    public var city : String?
    public var state : String?
    public var zip : Int?
    
    //include init method with args for all attributes, and initialize them with values passed in
    init (firstName : String, lastName : String, age : Int, street : String, city : String, state : String, zip : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
    }
}


    



