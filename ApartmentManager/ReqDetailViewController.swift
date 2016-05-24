//
//  ReqDetailViewController.swift
//  ApartmentManager
//
//  Created by Demond Childers on 5/18/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//

import UIKit
import AVFoundation


class ReqDetailViewController: UIViewController, UIPickerViewDelegate {
    
    
    
    let backendless = Backendless.sharedInstance()
    var currentUser = BackendlessUser()
    var newRequest :Requests?
    
    
    
    @IBOutlet private weak var requestNameTextField         :UITextField!
    @IBOutlet private weak var requestDescripTextView       :UITextView!
    @IBOutlet private weak var requestPrioritySwitch        :UISwitch!
    @IBOutlet private weak var requestDatePickerView        :UIDatePicker!
    
    
    
    // INTERACTIVITY METHODS ~ ADD IBOutlets for Text Field and Descrip for New Request on StoryBoard
    
    
    @IBAction private func addRecordWithAdmin() {
        let newRequest = Requests()
        
        newRequest.requestToDo = "Fix Lighting"
        newRequest.requestComplete = "Repair Dishwasher"
        newRequest.requestPriority = false
        //      newRequest.requestDateCreated = NSDate(NSDateFormatter: yyyy:MM:dd, MM:HH:SS)
        newRequest.requestDescript = "Replaced valve in washer motor"
        newRequest.ownerId = currentUser.objectId
        
    }
    
    
    
    
    
    @IBAction func saveButtonPressed(button: UIBarButtonItem) {
        print("Save Pressed")
        guard let requests = newRequest else {
            return
        }
        requests.requestToDo = requestNameTextField.text!
        requests.requestDescript = requestDescripTextView.text!
        requests.requestPriority = requestPrioritySwitch.on
        requests.requestDateCreated = requestDatePickerView.date
        
        saveNewRequest(requests)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    @IBAction private func trashButtonPressed (button: UIBarButtonItem) {
        print("Request Removed")
        if let requestSelected = newRequest {
            backendless.delete(requestSelected)
            saveNewRequest(requestSelected)
        }
    }
    
    
    // Saves New Maintainence Request
    
    private func saveNewRequest(newRequest: Requests){
        print("Trying to Save")
        let dataStore = backendless.data.of(Requests.ofClass())
        dataStore.save(newRequest, response: { (result) in
            print("Request has been Saved")
            
        }) { (error) in
            print("Request not saved Error:\(error)")
        }
        
    }
    
    
    //    func saveAndPop() {
    //        appDelegate.saveContext()
    //        self.navigationController?.popViewControllerAnimated(true)
    //
    //    }
    
    
    
    //MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRecordWithAdmin()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let requests = newRequest {
            requestNameTextField.text = requests.requestToDo
            requestDescripTextView.text = requests.requestDescript
            requestDatePickerView.date = requests.requestDateCreated
            requestPrioritySwitch.on = requests.requestPriority
        } else {
            newRequest = Requests()
            requestNameTextField.text = ""
            requestDescripTextView.text = ""
            requestDatePickerView.date = NSDate()
            requestPrioritySwitch.on = true
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
