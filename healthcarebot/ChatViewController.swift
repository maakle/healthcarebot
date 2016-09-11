//
//  ChatViewController.swift
//  MitfahrerApp
//
//  Edited by Raoul Friedrich on 23/03/15.
//  Copyright (c) 2015 Canoco. All rights reserved.
//
import UIKit
import JSQMessagesViewController
import ConversationV1

class ChatViewController: JSQMessagesViewController {
    
    private var messages = [JSQMessage]()
    private var outgoingBubbleImageView = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
    private var incomingBubbleImageView = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    var context: Context? // save context to continue conversation
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        senderId = "id"
        senderDisplayName = "Me"
        self.title = "HealthcareBot"

        
        automaticallyScrollsToMostRecentMessage = true
        
        senderDisplayName = (senderDisplayName != nil) ? senderDisplayName : "Anonymous"
        collectionView?.collectionViewLayout.incomingAvatarViewSize = .zero
        collectionView?.collectionViewLayout.outgoingAvatarViewSize = .zero
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView!.collectionViewLayout.springinessEnabled = true
    }
    
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        //TODO
        
        let message = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
        messages.append(message)
        self.finishSendingMessage()
        
        // Do any additional setup after loading the view.
        let failure = { (error: NSError) in print(error) }
        
        
        conversation.message(workspaceID, text: text, context: context, failure: failure) { response in
            print(response.output.text)
            self.context = response.context
            let message = JSQMessage(senderId: "Server", senderDisplayName: "Server", date: date, text: response.output.text[0])
            
            let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
            dispatch_after(time, dispatch_get_main_queue()) {
                //put your code which should be executed with a delay here
                self.messages.append(message)
                self.collectionView?.reloadData()
                self.scrollToBottomAnimated(true)
            }
            
           
        }
        
        
    }
    // MARK: - CollectionView functions
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
//        print(messages[indexPath.item].text!)
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item]
        // Check if the user sent the message or message is an incoming one from another user
        if message.senderId == senderId {
            return outgoingBubbleImageView
        }
        return incomingBubbleImageView
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        let message = messages[indexPath.item]
        if message.senderId == senderId {
            cell.textView!.textColor = UIColor.whiteColor()
        } else {
            cell.textView!.textColor = UIColor.blackColor()
        }
        
        let attributes = [NSForegroundColorAttributeName: cell.textView!.textColor!, NSUnderlineStyleAttributeName: 1]
        cell.textView!.linkTextAttributes = attributes
        
        return cell
    }
}