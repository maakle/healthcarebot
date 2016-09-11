//
//  MainUiTableViewController.swift
//  healthcarebot
//
//  Created by Mathias Klenk on 11/09/16.
//  Copyright © 2016 Mathias Klenk. All rights reserved.
//

import UIKit

class MainUiTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        setLogoStyles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLogoStyles(){
        // Logo in NavBar
        let logo = UIImage(named: "loclbirdLogo_white")
        let logoView = UIImageView(image: logo)
        //logoView.frame.size.width = 100
        logoView.frame.size.height = 50
        logoView.contentMode = .ScaleAspectFit
        logoView.image = logo
        
        navigationItem.titleView = logoView
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            let chatView = ChatViewController()
//            let chatNavigationController = UINavigationController(rootViewController: chatView)
            self.navigationController?.pushViewController(chatView, animated: true)
        } else if indexPath.row == 2 {
            self.navigationController?.pushViewController(ConversationViewController(), animated: true)
        }
        
    }
 

}
