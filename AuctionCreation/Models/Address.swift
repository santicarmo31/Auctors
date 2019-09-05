//
//  Address.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

struct Address: Codable {
    let addrid: Int
    let auctionId: Int
    let id: Int
    
    private enum Keys: String, CodingKey {
        case addrid, auctionId, id
    }
}

extension Address {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self) // defining our (keyed) container
        let addrid: Int = try container.decode(Int.self, forKey: .addrid)
        let auctionId: Int = try container.decode(Int.self, forKey: .auctionId)
        let id: Int = try container.decode(Int.self, forKey: .id)
        
        self.init(addrid: addrid, auctionId: auctionId, id: id)
    }
}
