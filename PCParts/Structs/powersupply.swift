//
//  powersupply.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import Foundation
import UIKit

class PSU {
    var name:String?
    var wattage:Int?
    var model:String?
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
        self.wattage = nil
        self.model = nil
        self.Manu = nil // manufacturer
        self.image = nil
        self.price = nil
        self.link = nil
    }
    init(NAME:String,WATTAGE:Int,MODEL:String,MANUFACTURER:String,IMAGE:UIImage,PRICE:Double,LINK:URL) {
        self.name = NAME
        self.wattage = WATTAGE
        self.model = MODEL
        self.Manu = MANUFACTURER // manufacturer
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
    }
}
