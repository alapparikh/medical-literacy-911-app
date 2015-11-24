//
//  QuestionViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 11/23/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial question : Jon
    }
    
    @IBAction func onYesButtonPressed(sender: AnyObject) {
        // Go to next view controller : ALAP
    }
    
    @IBAction func onNoButtonPressed(sender: AnyObject) {
        // Go to next question : Jon
        questionLabel.text = "Hello idiots"
    }
}
