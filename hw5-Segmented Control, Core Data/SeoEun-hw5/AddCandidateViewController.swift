//
//  AddCandidateViewController.swift
//  SeoEun-hw5
//
//  Created by Eun Susan Seo on 2/25/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit
import CoreData

class AddCandidateViewController: UIViewController {

    // Core Data object
    // Holds instances of NSManagedObject rather than our Person class objects
    var candidates = [NSManagedObject]()
    
    
    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var politicalPartyLbl: UILabel!
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var politicalPartyCtrl: UISegmentedControl!
    
    @IBOutlet weak var txtLbl: UILabel!
    
    var alertController:UIAlertController? = nil
    //var candidate: Candidate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtLbl.isHidden = true
        
        
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
        //if any fields empty
        if (firstNameField.text?.isEmpty ?? true) || (lastNameField.text?.isEmpty ?? true) || (stateField.text?.isEmpty ?? true) {
           
            //don't let user continue
            self.alertController = UIAlertController(title: "Error", message: "You must enter values for all fields", preferredStyle: UIAlertControllerStyle.alert)

            ////UIAlert properties////
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            }
            self.alertController!.addAction(OKAction) //make sure to add action objects to controller
            self.present(self.alertController!, animated: true, completion:nil) //tell iOS to show what you added to controller
            ////End UIAlert properties///
            
        //if no fields are empty
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            // Create the entity we want to save
            // Here we are creating an entity using Candidate class' structure
            let entity =  NSEntityDescription.entity(forEntityName: "Candidate", in: managedContext)
            
            let candidate = NSManagedObject(entity: entity!, insertInto: managedContext)
            
            // Set the attribute values
            candidate.setValue(firstNameField.text, forKey: "firstName")
            candidate.setValue(lastNameField.text, forKey: "lastName")
            candidate.setValue(stateField.text, forKey: "state")
            
            var politicalParty: String = ""
            if politicalPartyCtrl.selectedSegmentIndex == 0 {
                politicalParty = politicalPartyCtrl.titleForSegment(at: 0)!
            }
            else {
                politicalParty = politicalPartyCtrl.titleForSegment(at: 1)!
            }
            
            candidate.setValue(politicalParty, forKey: "politicalParty")
            
            
            // Commit the changes.
            do {
                try managedContext.save()
            } catch {
                // what to do if an error occurs?
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
            
            // Add the new entity to our array of managed objects
            candidates.append(candidate)
            
            //2. Let user know data has been saved
            txtLbl.text = "Candidate saved!"
            
            txtLbl.isHidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

