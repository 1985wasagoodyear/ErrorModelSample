//
//  ItemsViewController+Dialog.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

extension ItemsViewController {
    
    func hideNewsLoadingUI() {
        newsTableView.backgroundView = nil
    }
    
    func showNewsLoadingUI() {
        newsTableView.backgroundView = makeSpinner()
    }
    
    func hideFoodLoadingUI() {
        foodTableView.backgroundView = nil
    }
    
    func showFoodLoadingUI() {
        foodTableView.backgroundView = makeSpinner()
    }
    
    func makeSpinner() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.backgroundColor = .red
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }
    
    func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Oops! Something happened!",
                                      message: errorMessage,
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK",
                               style: .default)
        alert.addAction(ok)
        self.present(alert,
                     animated: true)
    }
    
    func showActionsDialog() {
        let alert = UIAlertController(title: "Choose an Action",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let fetchNews = UIAlertAction(title: "Fetch News",
                               style: .default) { _ in
                                self.newsViewModel.fetchNews()
        }
        let newsError = UIAlertAction(title: "Error for News",
                                      style: .default) { _ in
                                        self.newsViewModel.showError()
        }
        let noNews = UIAlertAction(title: "Show No News",
                                   style: .default) { _ in
                                    self.newsViewModel.showEmpty()
        }
        let fetchFood = UIAlertAction(title: "Fetch Food",
                                      style: .default) { _ in
                                        self.foodViewModel.fetchFoods()
        }
        let foodError = UIAlertAction(title: "Error for Food",
                                      style: .default) { _ in
                                        self.foodViewModel.showError()
        }
        let noFood = UIAlertAction(title: "Show No Food",
                                   style: .default) { _ in
                                    self.foodViewModel.showEmpty()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(fetchNews)
        alert.addAction(newsError)
        alert.addAction(noNews)
        alert.addAction(fetchFood)
        alert.addAction(foodError)
        alert.addAction(noFood)
        alert.addAction(cancel)
        self.present(alert,
                     animated: true)
    }
    
}
