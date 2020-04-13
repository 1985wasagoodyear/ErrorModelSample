//
//  ItemsViewController.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

final class ItemsViewController: UIViewController {
    
    // MARK: - Constants Definitions
    
    enum Constants {
        static let reuseId = "DefaultCellReuseId"
    }
    
    // MARK: - Properties
    
    lazy var newsTableView: UITableView = makeTableView()
    lazy var foodTableView: UITableView = makeTableView()
    
    var newsViewModel: NewsViewModel = NewsViewModel()
    var foodViewModel: FoodViewModel = FoodViewModel()

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewModels()
    }
    
    // MARK: - Custom Action Methods
    
    @IBAction func optionsButtonAction(_ sender: UIBarButtonItem) {
        showActionsDialog()
    }
    
}

// MARK: - Setup

extension ItemsViewController {
    
    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: Constants.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.roundify()
        self.view.addSubview(tableView)
        return tableView
    }
    
    func setupViews() {
        view.backgroundColor = .cyan
        let constraints: [NSLayoutConstraint] = makeNewsTableViewConstraints()
            + makeFoodTableViewConstraints()
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupViewModels() {
        let queue: DispatchQueue = .main
        newsViewModel.bind { (status) in
            queue.async {
                self.newsTableView.reloadData()
                switch status {
                case .loaded:
                    self.hideNewsLoadingUI()
                case .loading:
                    self.showNewsLoadingUI()
                case .empty:
                    self.showError("No News Found")
                    self.hideNewsLoadingUI()
                case .error(let errorMessage):
                    self.showError(errorMessage)
                    self.hideNewsLoadingUI()
                }
            }
        }
        foodViewModel.bind { (status) in
            queue.async {
                self.foodTableView.reloadData()
                switch status {
                case .loaded:
                    self.hideFoodLoadingUI()
                case .loading:
                    self.showFoodLoadingUI()
                case .empty:
                    self.showError("No Foods Found")
                    self.hideFoodLoadingUI()
                case .error(let errorMessage):
                    self.showError(errorMessage)
                    self.hideFoodLoadingUI()
                }
            }
        }
    }
    
    func makeNewsTableViewConstraints() -> [NSLayoutConstraint] {
        let table = newsTableView
        return [
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ]
    }
    
    func makeFoodTableViewConstraints()-> [NSLayoutConstraint] {
        let table = foodTableView
        return [
            table.topAnchor.constraint(equalTo: newsTableView.bottomAnchor,
                                       constant: 8.0),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            table.heightAnchor.constraint(equalTo: newsTableView.heightAnchor)
        ]
    }
    
}
