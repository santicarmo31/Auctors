//
//  MockModel.swift
//  AuctionCreationTests
//
//  Created by Santiago Carmona Gonzalez on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation
@testable import AuctionCreation

struct MockModel {
    private init() {
    }
    
    static let auctionHolder = AuctionHolder(auction: Auction.init(archived: false, auctionAppType: "", creationDate: "", id: 0, inventoryCode: "", modificationDate: "", orgId: 0, selected: false, uniqueIdentifier: "", actualEndDate: 0, conditionCodeName: "", description: "", quantity: 0, title: "TEST"), addresses: [], entityDescriptionTemplateData: [], categories: [])
    static let updatedAuction = Auction.init(archived: false, auctionAppType: "", creationDate: "", id: 0, inventoryCode: "", modificationDate: "", orgId: 0, selected: false, uniqueIdentifier: "", actualEndDate: 0, conditionCodeName: "", description: "", quantity: 0, title: "Update test")
}
