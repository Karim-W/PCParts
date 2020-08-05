//
//  cooler.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//
import UIKit
import Foundation

class Cooler{
    var name:String?
    var socketType:String?
    var type:String?
    var Manu:String? // manufacturer
    var image:UIImage?
    var price:Double?
    var link:URL?
//MARK:Constructors
    init?() {
        return nil
    }
    
    init(n:String) {
        self.name = n
        self.socketType = nil
        self.type = nil
        self.Manu = nil // manufacturer
        self.image = nil
        self.price = nil
        self.link = nil
    }
    init(NAME:String,SOCKETTYPE:String,TYPE:String,MANUFACTURER:String,IMAGE:UIImage,PRICE:Double,LINK:URL) {
        self.name = NAME
        self.socketType = SOCKETTYPE
        self.type = TYPE
        self.Manu = MANUFACTURER // manufacturer
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
    }
}
