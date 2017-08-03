//
//  NameTableViewCell.swift
//  SeoEun-hw4
//
//  Created by Eun Susan Seo on 2/19/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    
    var vc: ContactTableViewController?
    var person: Person?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func detailsBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Person", message: "\((person?.firstName)!) \((person?.lastName)!) \((person?.age)!)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
        alert.addAction(action)

        vc?.present(alert, animated: true, completion: nil)
    }

}
