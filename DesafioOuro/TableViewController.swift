//
//  TableViewController.swift
//  DesafioOuro
//
//  Created by Student on 3/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var albums: [Album]!
    var movies: [Movie]! = [Movie]()
    
    var requestHelper: RequestTMDB!
    
    private var selectedAlbum: Album!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Set up a refresh control, call reload to start things up
        requestHelper = RequestTMDB()
        
        refreshControl = UIRefreshControl()
//        refreshControl?.addTarget(self, action: "reload", forControlEvents: .ValueChanged)
//        reload()
        requestHelper.request("https://api.themoviedb.org/3/movie/popular?api_key=beebbeb51a373274d8f87662b8bb4193&page=1")
        refreshControl?.beginRefreshing()
        
        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: CGRectGetHeight((self.tabBarController?.tabBar.frame)!), right: 0)
        self.tableView.contentInset = adjustForTabbarInsets
        self.tableView.scrollIndicatorInsets = adjustForTabbarInsets
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("retreivedMovies:"), name: "MovieFetched", object: nil)
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
        
        
    }
    
    func retreivedMovies(notification: NSNotification) {
        
        // TODO: Query banco
        let realm = try! Realm()
        
        self.movies = realm.objects(Movie)
        
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
