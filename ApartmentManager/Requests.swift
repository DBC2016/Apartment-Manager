//
//  Requests.swift
//  ApartmentManager
//
//  Created by Demond Childers on 5/18/16.
//  Copyright © 2016 Demond Childers. All rights reserved.
//

import UIKit


class Requests: NSObject {
    
    var requestToDo            :String = ""
    var requestComplete        :String = ""
    var requestDescript        :String = ""
    var requestPriority        :Bool = false
    var requestDateCreated     :NSDate!
    var ownerId                :String = ""

}
