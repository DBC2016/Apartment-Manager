//
//  ReqDetailViewController.swift
//  ApartmentManager
//
//  Created by Demond Childers on 5/18/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//

import UIKit

class ReqDetailViewController: UIViewController {

    @IBAction private func addRecordWithAdmin() {
        let newRequest = Requests()
        
        
        //        newRequest.requestToDo = "Clean the dishes"
        //        newRequest.requestToComple = NSDate(timeIntervalSinceNow:  60 * 60 * 24 * 2)
        //        newRequest.toDoPriority = 1
        //        newRequest.ownerId = currentUser.objectId
        
    }

    //    private func saveRequest(request: ){
    //        let dataStore = backendless.data.of(UserToDo.ofClass())
    //        dataStore.save(toDo, response: { (response) in
    //            print("ToDo has been saved")
    //        }) { (error) in
    //            print("ToDo not saved error \(error)")
    //        }
    //        
    //    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
