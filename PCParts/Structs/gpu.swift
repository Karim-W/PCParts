//
//  gpu.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import Foundation
import UIKit

class GPU{
    var name:String?
    var Manu:String? // manufacturer
    var clocks:Double?
    var memory:Int?
    var memtype:String?
    var power:Int?
    var SLI:Bool?
    var crossFire:Bool?
    var shaders:Int?
    var TMU:Int?
    var ROPs:Int?
    var bus:String?
    var image:UIImage?
    var price:Double?
    var link:URL?
//MARK:Constructors
    init?() {
        return nil
    }
    
    init(name:String) {
        self.name = name
        self.Manu = nil // manufacturer
        self.clocks = nil
        self.memory = nil
        self.memtype = nil
        self.power = nil
        self.SLI = nil
        self.crossFire = nil
        self.shaders = nil
        self.TMU = nil
        self.ROPs = nil
        self.bus = nil
        self.image = nil
        self.price = nil
        self.link = nil
    }
    init(NAME:String,CLOCKS:Double,MEMORY:Int,MEMORYTYPE:String,POWER:Int,sli:Bool,CROSSFIRE:Bool,SHADERS:Int,tmu:Int,ROPS:Int,PCIEv:String ,MANUFACTURER:String,IMAGE:UIImage, PRICE:Double,LINK:URL) {
        self.name = NAME
        self.Manu = MANUFACTURER // manufacturer
        self.clocks = CLOCKS
        self.memory = MEMORY
        self.memtype = MEMORYTYPE
        self.power = POWER
        self.SLI = sli
        self.crossFire = CROSSFIRE
        self.shaders = SHADERS
        self.TMU = tmu
        self.ROPs = ROPS
        self.bus = PCIEv
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
    }
    
    
}
