//
//  global.swift
//  tips
//
//  Created by Kevin Tran on 12/15/15.
//  Copyright © 2015 Kevin Tran. All rights reserved.
//

import Foundation


class Main{
    var name:String
    init(name:String){
        self.name = name
    }
}

var mainInstance = Main(name: "My Global Class")