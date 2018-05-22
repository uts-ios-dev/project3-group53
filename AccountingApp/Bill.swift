//
//  Bill.swift
//  AccountingApp
//
//  Created by tinkon on 2018/5/21.
//  Copyright © 2018年 Henry Lam. All rights reserved.
//

import Foundation

struct Bill{
    var year = "yyyy"
    var month = "MM"
    var day = "dd"
    var purpose = "eat"
    var money = 0
}

var bill: Bill = Bill(year:"yyyy", month:"MM", day:"dd", purpose: "eat", money:0)
