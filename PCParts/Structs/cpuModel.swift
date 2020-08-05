//
//  cpuModel.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//
import UIKit
import Foundation

class CPU{
    var Name:String
    var coreNum:Int
    var threadNum:Int
    var freqGhz:Double
    var processNM:Int?
    var socket:String?
    var memChan:Int?//Memory Channels
    var memType:String? // Memory Type
    var TDP:Int?
    var L1Cache:Double?
    var L2Cache:Double?
    var L3Cache:Double?
    var Manu:String? // manufacturer
    var image:UIImage?
    var price:Double?
    var link:URL?
//MARK:Constructors
    init?() {
        return nil
    }
    
    init(NAME:String,CORENUMBER:Int,FREQUENCY:Double) {
        self.Name = NAME
        self.coreNum = CORENUMBER
        self.freqGhz = FREQUENCY
        self.threadNum = 2*CORENUMBER
        self.processNM = nil
        self.socket = nil
        self.memChan = nil//Memory Channels
        self.memType = nil  // Memory Type
        self.TDP = nil
        self.L1Cache = nil
        self.L2Cache = nil
        self.L3Cache = nil
        self.Manu = nil // manufacturer
        self.image = nil
        self.price = nil
        self.link = nil
    }
    init(NAME:String,CORENUMBER:Int,FREQUENCY:Double,THREADS:Int,NM_PROCESS:Int,SOCKET:String,MEMORYCHANNELS:Int,MEMORYTYPE:String,tdp:Int,l1:Double,l2:Double,l3:Double,MANUFACTURER:String,IMAGE:UIImage,PRICE:Double,LINK:URL) {
        self.Name = NAME
        self.coreNum = CORENUMBER
        self.freqGhz = FREQUENCY
        self.threadNum = THREADS
        self.processNM = NM_PROCESS
        self.socket = SOCKET
        self.memChan = MEMORYCHANNELS//Memory Channels
        self.memType = MEMORYTYPE  // Memory Type
        self.TDP = tdp
        self.L1Cache = l1
        self.L2Cache = l2
        self.L3Cache = l3
        self.Manu = MANUFACTURER // manufacturer
        self.image = IMAGE
        self.price = PRICE
        self.link = LINK
    }
}
