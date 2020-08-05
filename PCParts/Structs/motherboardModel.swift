//
//  motherboardModel.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//
import UIKit
import Foundation

class MoBo {
    var name:String?
    var formFactor:String?
    var socketType:String?
    var SLI:Bool?
    var crossFire:Bool?
    var PCIE:PCIEslots?
    var ECC:Bool?
    var memSlots:Int?
    var M2Slots:Int?
    var Manu:String? // manufacturer
    var image:UIImage?
    var price:Double?
    var link:URL?
    
    init?() {
        return nil
    }
    
    init(NAME:String) {
        self.name = NAME
        self.formFactor = nil
        self.socketType = nil
        self.SLI = nil
        self.crossFire = nil
        self.PCIE = nil
        self.ECC = nil
        self.memSlots = nil
        self.M2Slots = nil
        self.Manu = nil // manufacturer
        self.image = nil
        self.price = nil
        self.link = nil
    }
    init(NAME:String,FORMFACTOR:String,SOCKETTYPE:String,sli:Bool,CROSSFIRE:Bool,PCIEv1:Int,PCIEv2:Int,PCIEv3:Int,PCIEv4:Int,ecc:Bool,MEMORYSLOTS:Int,M2SLOTS:Int,MANUFACTURER:String,IMAGE:UIImage,PRICE:Double,LINK:URL) {
        let t = PCIEslots(p1: PCIEv1, p2: PCIEv2, p3: PCIEv3, p4: PCIEv4)
        self.name = NAME
        self.formFactor = FORMFACTOR
        self.socketType = SOCKETTYPE
        self.SLI = sli
        self.crossFire = CROSSFIRE
        self.PCIE = t
        self.ECC = ecc
        self.memSlots = MEMORYSLOTS
        self.M2Slots = M2SLOTS
        self.Manu = MANUFACTURER // manufacturer
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
    }
    
}

struct PCIEslots{
    var PCIEv1:Int?
    var PCIEv2:Int?
    var PCIEv3:Int?
    var PCIEv4:Int?
    
    init(p1:Int,p2:Int,p3:Int,p4:Int) {
        PCIEv1 = p1
        PCIEv2 = p2
        PCIEv3 = p3
        PCIEv4 = p4
    }
}
