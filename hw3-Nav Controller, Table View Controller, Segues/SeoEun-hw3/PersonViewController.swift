//
//  PersonViewController.swift
//  SeoEun-hw3
//
//  Created by Eun Susan Seo on 2/10/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    // 3. Define a property named person of type Person.
    
    var person:Person?
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLbl.text = person?.firstName
        lastNameLbl.text = person?.lastName
        ageLbl.text = "\((person?.age)!)"
        cityLbl.text = person?.city
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    


}
