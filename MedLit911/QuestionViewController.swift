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
    
    var questionList = [
        "Is the patient responsive to touch or speech?",
        "Is the patient having discomfort in the center of the chest (>a few minutes or intermittent)? (uncomfortable pressure, squeezing, fullness or pain.)",
        "Is the patient having trouble breathing or irregularly gasping for air?",
        "Does one side of the patient's face droop or is it numb? (Ask the person to smile.)",
        "Is one of the patient's arm weak or numb? Does one arm drift downward when the person raises both arms?",
        "Is the patient's speech slurred -- are they unable to speak or hard to understand?",
        "Is the patient having trouble breathing or is irregularly gasping for air?",
        "Is the patient unconscious?"
    ]
    
    var nextQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questionList[nextQuestion++]
    }
    
    @IBAction func onYesButtonPressed(sender: AnyObject) {
        // Go to next view controller : ALAP
    }
    
    @IBAction func onNoButtonPressed(sender: AnyObject) {
        if nextQuestion == questionList.count {
            // Go to don't know view controller
        } else {
            questionLabel.text = questionList[nextQuestion++]
        }
    }
}
