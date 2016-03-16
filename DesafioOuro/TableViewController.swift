//
//  TableViewController.swift
//  DesafioOuro
//
//  Created by Student on 3/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var albums: [Album]!
    
    private var selectedAlbum: Album!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Set up a refresh control, call reload to start things up
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "reload", forControlEvents: .ValueChanged)
//        reload()
//        refreshControl?.beginRefreshing()
        
        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: CGRectGetHeight((self.tabBarController?.tabBar.frame)!), right: 0)
        self.tableView.contentInset = adjustForTabbarInsets
        self.tableView.scrollIndicatorInsets = adjustForTabbarInsets
        
        self.albums = [
            Album(withImage: UIImage(named: "album_one")!, andTitle: "Work", andDetail: "Rihanna feat. Drake"),
            Album(withImage: UIImage(named: "album_two")!, andTitle: "Love Yourself", andDetail: "Justin Bieber"),
            Album(withImage: UIImage(named: "album_three")!, andTitle: "Stressed out", andDetail: "twenty one pilots"),
            Album(withImage: UIImage(named: "album_two")!, andTitle: "Sorry", andDetail: "Justin Bieber"),
            Album(withImage: UIImage(named: "album_five")!, andTitle: "My House", andDetail: "Flo Rida"),
            Album(withImage: UIImage(named: "album_six")!, andTitle: "Pillow Talk", andDetail: "Zayn"),
            Album(withImage: UIImage(named: "album_seven")!, andTitle: "Me, Myself & I", andDetail: "G-Eazy x Bebe Rexha")
        ]
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.album = self.albums[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        
//        self.selectedAlbum = self.albums[indexPath.row]
//        
//        self.performSegueWithIdentifier("showDetailSegue", sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Helper Methods
    
    func reload() {
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetailSegue" {
            
            let destinationViewController: MovieDetailTableViewController = segue.destinationViewController as! MovieDetailTableViewController
            
            destinationViewController.album = self.albums[(tableView.indexPathForSelectedRow?.row)!]
        }
        
    }
    
    @IBAction func unwindToTableViewController(segue: UIStoryboardSegue) {
        
    }

}
