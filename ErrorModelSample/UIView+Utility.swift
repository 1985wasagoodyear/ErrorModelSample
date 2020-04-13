//
//  UIView+Utility.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

extension UIView {
    func roundify() {
        layer.cornerRadius = 16.0
        layer.masksToBounds = true
    }
}
