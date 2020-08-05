//
//  Build.swift
//  PCParts
//
//  Created by Karim Wael on 7/30/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import Foundation
import UIKit

struct Build {
    var cpu = CPU()
    var Motherboard = MoBo()
    var Ram = [RAM]()
    var storage = [Storage]()
    var gpu = [GPU]()
    var CPUCooler = Cooler()
    var psu = PSU()
    var accessories = [Accessories]()
    init?() {
        return nil
    }
    init?(Cpu:String,FREQ:Double,CORENUM:Int,MOBO:String,ram:Double,STOREAGE:Double,Gpu:String,Psu:String) {
        self.cpu = CPU(NAME: Cpu, CORENUMBER: CORENUM, FREQUENCY: FREQ)
        self.Motherboard = MoBo(NAME: MOBO)
        self.Ram.append(RAM(s: ram))
        self.storage.append(Storage(s: STOREAGE))
        self.gpu.append(GPU(name: Gpu))
        self.psu = PSU(n: Psu)
        self.CPUCooler = nil
    }
    init?(CPu:CPU,MB:MoBo,RAm:[RAM],Store: [Storage],GPu:[GPU],cooler:Cooler,PSu:PSU, accessorie:[Accessories]){
        self.cpu = CPu
        self.Motherboard = MB
        self.Ram = RAm
        self.CPUCooler = cooler
        self.storage = Store
        self.gpu = GPu
        self.psu = PSu
        self.accessories = accessorie
    }
}
