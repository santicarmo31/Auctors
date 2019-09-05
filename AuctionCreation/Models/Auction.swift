//
//  Auction.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

struct Auction {
    let archived: Bool
    let auctionAppType: String
    let creationDate: String
    let id: Int
    let inventoryCode: String
    let modificationDate: String
    let orgId: Int
    let selected: Bool
    let uniqueIdentifier: String
    private(set) var actualEndDate: Int64
    private(set) var conditionCodeName: String
    private(set) var description: String
    private(set) var quantity: Int
    private(set) var title: String
    
    private enum Keys: String, CodingKey {
        case actualEndDate
        case archived
        case auctionAppType
        case conditionCodeName
        case creationDate
        case description
        case id
        case inventoryCode
        case modificationDate
        case orgId
        case quantity
        case selected
        case title
        case uniqueIdentifier
    }
    
    mutating func update(actualEndDate: Int64, description: String, quantity: Int, title: String) {
        self.actualEndDate = actualEndDate
        self.description = description
        self.quantity = quantity
        self.title = title
    }
}

extension Auction: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let actualEndDate: Int64 = try container.decode(Int64.self, forKey: .actualEndDate)
        let archived: Bool = try container.decode(Bool.self, forKey: .archived)
        let auctionAppType: String = try container.decode(String.self, forKey: .auctionAppType)
        let conditionCodeName: String = try container.decode(String.self, forKey: .conditionCodeName)
        let creationDate: Int = try container.decode(Int.self, forKey: .creationDate)
        let description: String = try container.decode(String.self, forKey: .description)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let inventoryCode: String = try container.decode(String.self, forKey: .inventoryCode)
        let modificationDate: Int = try container.decode(Int.self, forKey: .modificationDate)
        let orgId: Int = try container.decode(Int.self, forKey: .orgId)
        let quantity: Int = try container.decode(Int.self, forKey: .quantity)
        let selected: Bool = try container.decode(Bool.self, forKey: .selected)
        let title: String = try container.decode(String.self, forKey: .title)
        let uniqueIdentifier: String = try container.decode(String.self, forKey: .uniqueIdentifier)
        
        
        self.init(archived: archived, auctionAppType: auctionAppType, creationDate: "\(creationDate)", id: id, inventoryCode: inventoryCode, modificationDate: "\(modificationDate)", orgId: orgId, selected: selected, uniqueIdentifier: uniqueIdentifier, actualEndDate: actualEndDate, conditionCodeName: conditionCodeName, description: description, quantity: quantity, title: title)
    }
}
