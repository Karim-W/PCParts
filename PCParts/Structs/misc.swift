//
//  misc.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import Foundation
import UIKit

struct Accessories {
    var name:String?
    var type:String?
    var features:String?
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
        self.type = nil
        self.features = nil
        self.Manu = nil // manufacturer
        self.image = nil
        self.price = nil
        self.link = nil
    }
    init(NAME:String,TYPE:String,FEATURES:String,MANUFACTURER:String,IMAGE:UIImage,PRICE:Double,LINK:URL) {
        self.name = NAME
        self.type = TYPE
        self.features = FEATURES
        self.Manu = MANUFACTURER // manufacturer
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
    }
}
