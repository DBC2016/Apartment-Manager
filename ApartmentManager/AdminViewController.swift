//
//  AdminViewController.swift
//  ApartmentManager
//
//  Created by Demond Childers on 5/18/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    
    
    let backendless = Backendless.sharedInstance()
    var currentUser = BackendlessUser()

        private func saveRequest(request: Requests ){
            let dataStore = backendless.data.of(Requests.ofClass())
            dataStore.save(request, response: { (response) in
                print("ToDo has been saved")
            }) { (error) in
                print("ToDo not saved error \(error)")
            }
            
        }
    
        @IBAction func findToDos() {
            let dataQuery = BackendlessDataQuery()
    
            var error: Fault?
            let bc = backendless.data.of(Requests.ofClass()).find(dataQuery, fault:  &error)
            if error == nil {
                let tempArray = bc.getCurrentPage() as! [Requests]
                print("Found \(tempArray.count)")
            } else {
                print("Find Error \(error)")
    
            }
            
            
        }

    
    
    
    //MARK: - LIFE CYCLE METHODS
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //requestTableLoad(fix)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
