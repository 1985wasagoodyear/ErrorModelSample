//
//  ItemsViewController+TableView.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if tableView === newsTableView {
            return newsViewModel.count
        } else if tableView === foodTableView {
            return foodViewModel.count
        } else {
            fatalError("Invalid tableView found")
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView === newsTableView {
            return newsCell(for: indexPath)
        } else if tableView === foodTableView {
            return foodCell(for: indexPath)
        } else {
            fatalError("Invalid tableView found")
        }
    }
    
}


extension ItemsViewController: UITableViewDelegate {
    
}
