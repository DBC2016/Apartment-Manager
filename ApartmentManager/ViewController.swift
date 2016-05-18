//
//  ViewController.swift
//  ApartmentManager
//
//  Created by Demond Childers on 5/18/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    let backendless = Backendless.sharedInstance()
    var currentUser = BackendlessUser()
    
    
    
    //IBActions for Login Screen
    
    
    @IBOutlet private weak var emailEntry           :UITextField!
    @IBOutlet private weak var passwordEntry        :UITextField!
    @IBOutlet private weak var userRegister         :UIButton!
    @IBOutlet private weak var userLogIn            :UIButton!
    
    
    
    
    //MARK: - User Login Methods
    
    
    private func isValidLogin(email: String, password: String) -> Bool {
        return email.characters.count > 5 && password.characters.count > 4
        
    }
    
    @IBAction func textFieldChanged() {
        userRegister.enabled = false
        userLogIn.enabled = false
        
        guard let email = emailEntry.text else {
            return
        }
        guard let password = passwordEntry.text else {
            return
            
        }
        
        if isValidLogin(email, password: password) {
            userRegister.enabled = true
            userLogIn.enabled = true
        }
        
    }
    
    
    @IBAction private func registerNewUser(button: UIButton){
        guard let email = emailEntry.text else {
            return
        }
        guard let password = passwordEntry.text else {
            return
            
        }
        let user = BackendlessUser()
        user.email = email
        user.password = password
        backendless.userService.registering(user, response: { (registeredUser) in
            print("Success Registering \(registeredUser.email)")
        }) { (error) in
            print("Error Registering \(error)")
            
        }
        
    }
    
    // 2. TEST REGISTER/LOGIN/LOGOUT AND MAKE SURE SHOWS UP IN BACKENDLESS
    
    @IBAction private func loginUser(button: UIButton) {
        guard let email = emailEntry.text else {
            return
            
        }
        guard let password = passwordEntry.text else {
            
            return
            
        }
        
        backendless.userService.login(email, password: password, response:
            { (loggedInUser) in
                print("Logged In \(loggedInUser.email)")
                self.currentUser = loggedInUser
                self.performSegueWithIdentifier("segueResident", sender: self)
        }) { (error) in
            print("LogIn Error \(error)")
            
        }
        
    }
    
    
    @IBAction private func logoutUser(button: UIButton) {
        backendless.userService.logout({ (response) in
            print("Logged out")
        }) { (error) in
            print("Log Out Error \(error)")
        }
    }
    
    
    
    //MARK - LIFE CYCLE METHODS

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldChanged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

