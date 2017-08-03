//
//  DetailViewController.swift
//  SeoEun-hw5
//
//  Created by Eun Susan Seo on 2/25/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    //in this case, only calling a single candidate, thus not an array
    //var candidate: [NSManagedObject]()
    var candidate: NSManagedObject?
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var politicalPartyLbl: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        //getting the value post-set
        
        //setting the labels to the managedObject values
        firstNameLbl.text = candidate?.value(forKey: "firstName") as? String
        lastNameLbl.text =  candidate?.value(forKey: "lastName") as? String
        stateLbl.text = candidate?.value(forKey: "state") as? String
        politicalPartyLbl.text = candidate?.value(forKey: "politicalParty") as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
