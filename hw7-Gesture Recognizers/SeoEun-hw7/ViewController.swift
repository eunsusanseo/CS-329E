//
//  ViewController.swift
//  SeoEun-hw7
//
//  Created by Eun Susan Seo on 3/19/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //what's CGSize??
    //fileprivate var lblOriginalSize:CGSize = CGSize(width: 0, height: 0)
    //fileprivate var lblCurrentSize:CGSize =  CGSize(width: 0, height: 0)
    var xMovement: CGFloat = -50
    var isMovingLeft: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToRightSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToLeftSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @IBOutlet weak var myLbl: UILabel!
    
    @IBAction func tapGestureRecognizer(recognizer: UITapGestureRecognizer) {
        let viewFrame = self.view.frame
        var myLblFrame = myLbl.frame
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            //while xLoc is still within screenWidth
            if (viewFrame.origin.x - myLblFrame.origin.x > self.xMovement) && (self.isMovingLeft == true){
                self.xMovement = viewFrame.origin.x - myLblFrame.origin.x
            }
            else if (viewFrame.width - myLblFrame.maxX < self.xMovement) {
                self.xMovement = viewFrame.width - myLblFrame.maxX
            }
            
            //finished checks
            myLblFrame.origin.x += self.xMovement
            //myLblFrame is local var
            self.myLbl.frame = myLblFrame
            
        }) { (bool) in
            if (viewFrame.origin.x == myLblFrame.origin.x) {
                self.xMovement = 50
                self.isMovingLeft = false
                
            } else if (viewFrame.maxX == myLblFrame.maxX) {
                self.xMovement = -50
                self.isMovingLeft = true
            }
        }
    }

    
    func respondToRightSwipe() {
        let viewFrame = self.view.frame
        var myLblFrame = myLbl.frame
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            myLblFrame.origin.x = viewFrame.maxX
            self.myLbl.frame = myLblFrame
        }, completion: nil)
    }

    func respondToLeftSwipe() {
        let viewFrame = self.view.frame
        var myLblFrame = myLbl.frame

        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            myLblFrame.origin.x = viewFrame.origin.x - myLblFrame.width
            self.myLbl.frame = myLblFrame
        }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

