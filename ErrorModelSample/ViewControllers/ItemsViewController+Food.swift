//
//  ItemsViewController+Food.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

extension ItemsViewController {
    
    func foodCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: Constants.reuseId,
                                                     for: indexPath)
        cell.textLabel?.text = foodViewModel.title(for: indexPath.row) ?? "Missing"
        cell.backgroundColor = .clear
        return cell
    }
    
}
