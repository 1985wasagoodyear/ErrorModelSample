//
//  ViewModelStatus.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

enum ViewModelStatus {
    case loaded
    case loading
    case empty
    case error(String)
}

typealias ViewModelHandler = (ViewModelStatus) -> Void
