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
        setNavigationBarStyles()
        setLogoStyles()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLogoStyles(){
        // Logo in NavBar
        let logo = UIImage(named: "navigationLogo")
        let logoView = UIImageView(image: logo)
        logoView.frame.size.height = 45
        logoView.contentMode = .ScaleAspectFit
        logoView.image = logo
        
        navigationItem.titleView = logoView
    }
    
    func setNavigationBarStyles(){
        //Delete the little line(shadow) in navigation bar
        for parent in self.navigationController!.navigationBar.subviews {
            for childView in parent.subviews {
                if(childView is UIImageView) {
                    childView.removeFromSuperview()
                }
            }
        }
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            let chatView = ChatViewController()
            self.navigationController?.pushViewController(chatView, animated: true)
        }
        
        if indexPath.row == 2 {
            let emergencyVideoController = StartEmergencyVideoViewController()
            self.navigationController?.pushViewController(emergencyVideoController, animated: false)
        }
    
        
    }
 

}
