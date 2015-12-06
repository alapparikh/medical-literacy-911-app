//
//  PickLocationTableViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 12/5/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit

class PickLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let myarray = [
        "La Mangeoire - 1008 2nd Ave (btwn 53rd & 54th St.)",
        "Walgreens - 1000 2nd Ave",
        "Eclair Bakery - 305 E 53rd St (and Second Ave)",
        "Luna Piena - 243 53rd St (2nd Ave)",
        "A+ Thai Place - 1007 2nd Ave (at 53rd St.), New York, NY 10022",
        "Redemption - 1003 2nd Ave, New York, NY 10022",
        "Salnet Produce Inc - 1004 2nd Ave, New York, NY 10022",
        "53rd & Second Associates - 250 E 53rd St, New York, NY 10022",
        "Tenzan Japanese Restaurant - 988 2nd Ave, New York, NY 10022",
        "Dumpling King II - 986 2nd Ave, New York, NY 10022"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = myarray[indexPath.item]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print ("You selected a row")
        self.dismissViewControllerAnimated(true, completion: {})
    }
}
