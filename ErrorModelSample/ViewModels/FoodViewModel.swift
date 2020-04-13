//
//  FoodViewModel.swift
//  Created 4/13/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

private let delay: TimeInterval = 1.5

class FoodViewModel {
    
    // MARK: - Properties
    
    private var foods: [Food] = []
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

extension FoodViewModel {
    
    var count: Int {
        foods.count
    }
    
    func title(for index: Int) -> String? {
        guard index >= 0 && index < count else { return nil }
        return foods[index].name
    }
    
    func fetchFoods() {
        status = .loading
        DispatchQueue
            .global(qos: .background)
            .asyncAfter(deadline: .now() + delay) {
                self.foods = [.init(name: "Pasta"),
                              .init(name: "Spaghetti"),
                              .init(name: "Hasenpfeffer")]
                self.status = .loaded
        }
    }
    
}


// MARK: - Mock Helpers

extension FoodViewModel {

    func showError() {
        status = .loading
        DispatchQueue
            .global(qos: .background)
            .asyncAfter(deadline: .now() + delay) {
                self.foods.removeAll(keepingCapacity: true)
                self.status = .error("Unable to fetch Foods")
        }
    }
    
    func showEmpty() {
        status = .loading
        DispatchQueue
            .global(qos: .background)
            .asyncAfter(deadline: .now() + delay) {
                self.foods.removeAll(keepingCapacity: true)
                self.status = .empty
        }
    }
    
}
