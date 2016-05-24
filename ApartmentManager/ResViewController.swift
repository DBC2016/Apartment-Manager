//
//  ResidentViewController.swift
//  ApartmentManager
//
//  Created by Demond Childers on 5/18/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//


import UIKit



class ResViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var resTableView :UITableView!
    
    @IBOutlet weak var resReqTitleLabel     :UILabel!
    @IBOutlet weak var resDescLabel         :UILabel!
    

    let backendless = Backendless.sharedInstance()
    var currentUser = BackendlessUser()
    var requestArray = [Requests]()
    
    //MARK: - TABLE VIEW METHODS
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestArray.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ResidentTableViewCell
        let  newRequest = requestArray[indexPath.row]
        cell.resReqTitleLabel.text = newRequest.requestToDo
        cell.resDescLabel.text = newRequest.requestDescript
        
        return cell
    }
    

    
    
    
    //MARK: - Interactivity Methods
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destController = segue.destinationViewController as! ReqDetailViewController
        destController.currentUser = currentUser
        if segue.identifier == "residentToDetailSegue" {
            //
            let indexPath = resTableView.indexPathForSelectedRow
            let selectedEntry = requestArray[indexPath!.row]
            destController.newRequest = selectedEntry
            resTableView.deselectRowAtIndexPath(indexPath!, animated: true)
            
        } else if segue.identifier == "addRequestSegue" {
            destController.newRequest = nil
            
        }
        
    }
    
    
    
    
    func findRequests() {
        let dataQuery = BackendlessDataQuery()
        
        var error: Fault?
        let bc = backendless.data.of(Requests.ofClass()).find(dataQuery, fault:  &error)
        if error == nil {
            requestArray = bc.getCurrentPage() as! [Requests]
            resTableView.reloadData()
            print("Found \(requestArray.count)")
        } else {
            print("Find Error \(error)")
            
        }
        
    }
    
    //:MARK - LIFE CYCLE METHODS
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        findRequests()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
