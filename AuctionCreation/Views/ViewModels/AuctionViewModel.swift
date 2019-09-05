//
//  AuctionViewModel.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

struct AuctionViewModel {
    // MARK: - Vars & Constants
    
    var model: Auction
    
    var date: Date {
        let date = Date(timeIntervalSince1970: TimeInterval(model.actualEndDate) / milliSecondsFactor)
        return date
    }
    
    var actualEndDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    var conditionCodeName: String {
        return model.conditionCodeName
    }
    
    var description: String {
        return model.description
    }
    
    var quantity: String {
        return String(model.quantity)
    }
    
    var title: String {
        return String(model.title)
    }
    
    private let milliSecondsFactor: Double = 1000
    
    init(model: Auction) {
        self.model = model
    }
}
