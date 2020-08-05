//
//  storageModel.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import Foundation
import UIKit

class Storage{
    var name:String?
    var size:Double?
    var type:String?
    var interface:String?
    var cacheMB:Double?
    var readSpeed:Double?
    var writeSpeed:Double?
    var RPM:Int?
    var Manu:String? // manufacturer
    var image:UIImage?
    var price:Double?
    var link:URL?
//MARK:Constructors
    init?() {
        return nil
    }
    
    init(s:Double) {
        self.name = nil
        self.size = s
        self.type = nil
        self.interface = nil
        self.cacheMB = nil
        self.readSpeed = nil
        self.writeSpeed = nil
        self.RPM = nil
        self.Manu = nil // manufacturer
        self.image = nil
        self.price = nil
        self.link = nil
    }
    init(NAME:String,SIZE:Double,TYPE:String,INTERFACE:String,CACHEmb:Double,READSPEED:Double,WRITESPEED:Double,rpm:Int,MANUFACTURER:String,IMAGE:UIImage, PRICE:Double,LINK:URL) {
        self.name = NAME
        self.size = SIZE
        self.type = TYPE
        self.interface = INTERFACE
        self.cacheMB = CACHEmb
        self.readSpeed = READSPEED
        self.writeSpeed = WRITESPEED
        self.RPM = rpm
        self.Manu = MANUFACTURER // manufacturer
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
    }
    
}

