//
//  ViewController.swift
//  SeoEun-hw2
//
//  Created by Eun Susan Seo on 2/4/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        cityField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func btnSaveClicked(_ sender: Any) {
        if (nameField.text?.isEmpty)! || (cityField.text?.isEmpty)! {
            lbl.text = "You must enter a value for *both* name and city!!"
        }
        else {
            lbl.text = nameField.text! + " - " + cityField.text!
        }
    }
}

