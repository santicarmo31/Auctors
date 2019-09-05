//
//  Category.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

struct Category: Codable {
    let auctionId: Int
    let catid: Int
    let id: Int
    
    private enum Keys: String, CodingKey {
        case auctionId, catid, id
    }
}

extension Category {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let auctionId: Int = try container.decode(Int.self, forKey: .auctionId)
        let catid: Int = try container.decode(Int.self, forKey: .catid)
        let id: Int = try container.decode(Int.self, forKey: .id)
        
        self.init(auctionId: auctionId, catid: catid, id: id)
    }
}
