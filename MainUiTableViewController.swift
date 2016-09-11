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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        if(segue.identifier == "showDoctorWatson"){
//            let chatView = ChatViewController()
//            let chatNavigationController = UINavigationController(rootViewController: chatView)
//            presentViewController(chatNavigationController, animated: true, completion: nil)
//            
//            let destViewControllerChatViewController = segue.destinationViewController as! ChatViewController
//            
//        }
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            let chatView = ChatViewController()
//            let chatNavigationController = UINavigationController(rootViewController: chatView)
            self.navigationController?.pushViewController(chatView, animated: true)
        }
        
        
    }
 

}
