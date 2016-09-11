//
//  MainViewController.swift
//  healthcarebot
//
//  Created by Mathias Klenk on 10/09/16.
//  Copyright © 2016 Mathias Klenk. All rights reserved.
//

import UIKit
import ConversationV1

class MainViewController: UIViewController {

    //Outets
    @IBOutlet weak var testOutlet: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let failure = { (error: NSError) in print(error) }
        var context: Context? // save context to continue conversation
        
        
        conversation.message(workspaceID, text: "Hey there", context: context, failure: failure) { response in
            print(response.output.text)
            context = response.context
        
            conversation.message(workspaceID, text: "I'm feeling sick", context: context, failure: failure) { response in
                print(response.output.text)
                context = response.context
            }
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func testAction(sender: AnyObject) {
        testOutlet.text = "Got it!"
        
    }


}
