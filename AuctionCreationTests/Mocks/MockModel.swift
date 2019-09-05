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
    
    static let auctionHolder = AuctionHolder(auction: Auction.init(actualEndDate: 0, archived: true, auctionAppType: "", conditionCodeName: "", creationDate: "", description: "", id: 0, inventoryCode: "", modificationDate: "", orgId: 0, quantity: 0, selected: true, title: "TEST", uniqueIdentifier: ""), addresses: [], entityDescriptionTemplateData: [], categories: [])
}
