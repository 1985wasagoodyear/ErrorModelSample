//
//  NewsViewModel.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

private let delay: TimeInterval = 1.5

class NewsViewModel {
    
    // MARK: - Properties
    
    private var news: [News] = []
    private var status: ViewModelStatus = .empty {
        didSet {
            updateUI?(status)
        }
    }
    private var updateUI: ViewModelHandler?
    
    // MARK: - Data-binding Methods
    
    func bind(_ handler: @escaping ViewModelHandler) {
        self.updateUI = handler
    }
    
    func bindAndFire(_ handler: @escaping ViewModelHandler) {
        self.updateUI = handler
        handler(status)
    }
    
    func unbind() {
        self.updateUI = nil
    }
    
}

// MARK: - Accessors

extension NewsViewModel {
    
    var count: Int {
        news.count
    }
    
    func title(for index: Int) -> String? {
        guard index >= 0 && index < count else { return nil }
        return news[index].title
    }
    
    func fetchNews() {
        status = .loading
        DispatchQueue
            .global(qos: .background)
            .asyncAfter(deadline: .now() + delay) {
                self.news = [.init(title: "Sports"),
                              .init(title: "Money"),
                              .init(title: "Saskatchewan Film Industry Funding Cut")]
                self.status = .loaded
        }
    }
    
}


// MARK: - Mock Helpers

extension NewsViewModel {
    
    func showError() {
        status = .loading
        DispatchQueue
            .global(qos: .background)
            .asyncAfter(deadline: .now() + delay) {
                self.news.removeAll(keepingCapacity: true)
                self.status = .error("Unable to fetch News")
        }
    }
    
    func showEmpty() {
        status = .loading
        DispatchQueue
            .global(qos: .background)
            .asyncAfter(deadline: .now() + delay) {
                self.news.removeAll(keepingCapacity: true)
                self.status = .empty
        }
    }
    
}
