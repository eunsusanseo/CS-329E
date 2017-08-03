//
//  AddEmployeeViewController.swift
//  SeoEun-hw8
//
//  Created by Eun Susan Seo on 4/6/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    var vc: UITableViewController?
    
    //1. Get all user input from respective text fields
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var departmentLbl: UILabel!
    @IBOutlet weak var jobTitleLbl: UILabel!

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var departmentField: UITextField!
    @IBOutlet weak var jobTitleField: UITextField!
    
    var alertController:UIAlertController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //2. Package data, post notification and send data along
    @IBAction func btnSaveAction(_ sender: Any) {
        //2a. Get data from text fields
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        let department = departmentField.text!
        let jobTitle = jobTitleField.text!
        
        //2b. Package data into a dictionary
        let empDataDict = ["firstName":firstName, "lastName":lastName, "department":department, "jobTitle":jobTitle]
        
        NotificationCenter.default.post(name: Notification.Name("add-employee"), object: nil, userInfo: empDataDict)
        
        //let user know that employee has been added
        let alert = UIAlertController(title: "Add Employee", message: "Employee has been added!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        vc?.present(alert, animated: true, completion: nil)
    }
}
