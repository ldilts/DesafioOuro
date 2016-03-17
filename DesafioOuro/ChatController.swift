//
//  ChatController.swift
//  DesafioOuro
//
//  Created by Fernando Matheus on 16/03/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var messageBar: UIView!
    @IBOutlet weak var topViewHeigthConstraint: NSLayoutConstraint!
    @IBOutlet weak var spacerView: UIView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var table: UITableView!

    
    var messages: [String] = []
    
    
    @IBAction func actionSend(sender: AnyObject) {
        
        let text = self.textField.text
        
        self.messages.append(text!)
        
        table.reloadData()
        
        self.textField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.textField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidHide:", name: UIKeyboardDidHideNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidChange:", name: UIKeyboardDidChangeFrameNotification, object: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = "Nome do usuário"
        cell.textLabel?.textColor = UIColor.orangeColor()
        cell.detailTextLabel?.text = "\(messages[indexPath.row])"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func keyboardDidHide(notification: NSNotification) {
        
    }
    
    func keyboardDidChange(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            if let _ = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue {
                
                var keyboardFrameEnd = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue
                keyboardFrameEnd = self.view.convertRect(keyboardFrameEnd!, fromView: nil)
                
                UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
                    
                    self.topViewHeigthConstraint.constant = (self.view.frame.size.height - keyboardFrameEnd!.origin.y)
                    self.view.setNeedsLayout()
                    self.view.layoutIfNeeded()
                    }, completion: { (success: Bool) -> Void in
                })
            }
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
