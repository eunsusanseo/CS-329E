//
//  ShowCandidatesTableViewController.swift
//  SeoEun-hw5
//
//  Created by Eun Susan Seo on 2/25/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit
import CoreData

class ShowCandidatesTableViewController: UITableViewController {
    
    // Core Data object
    // Holds instances of NSManagedObject rather than our Person class objects
    var candidates = [NSManagedObject]()
    
    var firstNameField: UITextField? = nil
    var lastNameField: UITextField? = nil
    var stateField: UITextField? = nil
    var politicalPartyField: UITextField? = nil
    let reuseIdentifier = "cellid"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.candidates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let candidate = candidates[indexPath.row]
        
        //creating temp variables
        let firstName = candidate.value(forKey: "firstName") as? String
        let lastName = candidate.value(forKey: "lastName") as? String
        let politicalParty = candidate.value(forKey: "politicalParty") as? String
        
        cell.textLabel!.text = firstName! + " " + lastName!
        
        //use detailTextLabel for segmented controls
        cell.detailTextLabel!.text = politicalParty

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    fileprivate func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Candidate")
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            candidates = results
        } else {
            print("Could not fetch")
        }

    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "candidateSegue" {
            
            //this if let statement is making sure that there is a person view controller that exists
            if let detailViewController = segue.destination as? DetailViewController {
                
                let indexSelectedRow = tableView.indexPathForSelectedRow?.row
                
                detailViewController.candidate = candidates[indexSelectedRow!]
                
            }
        }
    }
}
