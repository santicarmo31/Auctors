//
//  AuctionHolder.swift
//  AuctionCreation
//
//  Created by Santiago Carmona Gonzalez on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

struct AuctionHolder {
    var auction: Auction
    let addresses: [Address]
    let entityDescriptionTemplateData: [String]
    let categories: [Category]
    
    private enum Keys: String, CodingKey {
        case auction
        case addresses
        case entityDescriptionTemplateData
        case categories
    }
    
}

extension AuctionHolder: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let auction: Auction = try container.decode(Auction.self, forKey: .auction)
        let addresses: [Address] = try container.decode([Address].self, forKey: .addresses)
        let entityDescriptionTemplateData: [String] = try container.decode([String].self, forKey: .entityDescriptionTemplateData)
        let categories: [Category] = try container.decode([Category].self, forKey: .categories)
        
        self.init(auction: auction, addresses: addresses, entityDescriptionTemplateData: entityDescriptionTemplateData, categories: categories)
    }
    
}
