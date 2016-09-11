//
//  MainViewController.swift
//  healthcarebot
//
//  Created by Mathias Klenk on 10/09/16.
//  Copyright © 2016 Mathias Klenk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //Outets
    @IBOutlet weak var testOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func testAction(sender: AnyObject) {
        testOutlet.text = "Got it!"
        
    }


}
