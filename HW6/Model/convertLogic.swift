//
//  convertLogic.swift
//  HW6
//
//  Created by Thomas Bowman on 6/30/25.
//

import Foundation
struct convertLogic {
    var usdAmmount : Int = 0
    var poundAmmount : Double = -1
    var euroAmmount : Double = -1
    var yenAmmount : Double = -1
    var yuanAmmount : Double = -1
    
    let poundRate = 0.73
    let euroRate = 0.89
    let yuanRate = 7.41
    let yenRate = 127.94
    mutating func convert (euro:Bool, pound:Bool, yen: Bool, yuan:Bool) {
        euroAmmount = euro ? Double(usdAmmount) * euroRate : -1
        poundAmmount = pound ? Double(usdAmmount) * poundRate : -1
        yenAmmount = yen ? Double(usdAmmount) * yenRate : -1
        yuanAmmount = yuan ? Double(usdAmmount) * yuanRate : -1
    }
}

