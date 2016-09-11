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

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(animated: Bool) {
        let chatView = ChatViewController()
        let chatNavigationController = UINavigationController(rootViewController: chatView)
        presentViewController(chatNavigationController, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
