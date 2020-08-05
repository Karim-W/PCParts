//
//  RAMmodel.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//
import UIKit
import Foundation

class RAM{
    var name:String?
    var quantity:Int?
    var size:Double?
    var type:String?
    var freq:Double?
    var Manu:String? // manufacturer
    var image:UIImage?
    var price:Double?
    var link:URL?
    var RGB:Bool?
//MARK:Constructors
    init?() {
        return nil
    }
    
    init(s:Double) {
        self.name = nil
        self.size = s
        self.quantity = nil
        self.freq = nil
        self.type = nil
        self.Manu = nil // manufacturer
        self.image = nil
        self.price = nil
        self.link = nil
        self.RGB = nil
    }
    init(NAME:String,SIZE:Double,QUANTITY:Int,FREQUENCY:Double,TYPE:String,MANUFACTURER:String,IMAGE:UIImage,PRICE:Double,LINK:URL,rgb:Bool) {
        self.name = NAME
        self.size = SIZE
        self.quantity = QUANTITY
        self.freq = FREQUENCY
        self.type = TYPE
        self.Manu = MANUFACTURER // manufacturer
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
        self.RGB = rgb
    }
}
