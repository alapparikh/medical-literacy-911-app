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
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var questionList = [
    
        "Is the patient unresponsive to touch or speech?",
        "Is the patient having discomfort in the center of the chest (>a few minutes or intermittent)? (uncomfortable pressure, squeezing, fullness or pain.)",
        "Is the patient having trouble breathing or irregularly gasping for air?",
        "Does one side of the patient's face droop or is it numb? (Ask the person to smile.)",
        "Is one of the patient's arm weak or numb? Does one arm drift downward when the person raises both arms?",
        "Is the patient's speech slurred -- are they unable to speak or hard to understand?",
        "Is the patient unconscious?"
    ]
    
    var imageList = [
        "unresponsive",
        "chest-pain",
        "trouble-breathing",
        "droop",
        "arm-drift",
        "speech",
        "unconscious"
    ]
    
    var nextQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noButton.layer.borderWidth = 1
        noButton.layer.borderColor = UIColor.grayColor().CGColor
        questionLabel.text = questionList[nextQuestion]
        imageView.image = UIImage(named: imageList[nextQuestion])
        nextQuestion++
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        longPressRecognizer.minimumPressDuration = 2.0
        longPressRecognizer.allowableMovement = 50.0
        yesButton.addGestureRecognizer(longPressRecognizer)
    }
    
    func longPressed(sender: UILongPressGestureRecognizer)
    {
        if (sender.state == UIGestureRecognizerState.Began) {
            print ("Show Connecting Screen")
            performSegueWithIdentifier("showConnectingScreen", sender: nil)
        }

    }
    
    @IBAction func onNoButtonPressed(sender: AnyObject) {
        if nextQuestion == questionList.count {
            // Go to don't know view controller
            performSegueWithIdentifier("showUnsureScreen", sender: nil)
            
        } else {
            questionLabel.text = questionList[nextQuestion]
            imageView.image = UIImage(named: imageList[nextQuestion])
            nextQuestion++
        }
    }
}
