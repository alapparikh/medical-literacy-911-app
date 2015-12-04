//
//  ViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 11/23/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onDoneButtonPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("showHomeScreen", sender: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

