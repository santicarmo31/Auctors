//
//  AuctionViewModel.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

struct AuctionViewModel {
    var auctionResponse: AuctionResponse
    
    
    var date: Date {
        let date = Date(timeIntervalSince1970: TimeInterval(auctionResponse.auction.actualEndDate) / 1000)
        return date
    }
    
    var actualEndDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    var conditionCodeName: String {
        return auctionResponse.auction.conditionCodeName
    }
    
    var description: String {
        return auctionResponse.auction.description
    }
    
    var quantity: String {
        return String(auctionResponse.auction.quantity)
    }
    
    var title: String {
        return String(auctionResponse.auction.title)
    }
    
    init(model: AuctionResponse) {
        auctionResponse = model
    }
}
