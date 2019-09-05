//
//  MockAuctionService.swift
//  AuctionCreationTests
//
//  Created by Santiago Carmona Gonzalez on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation
@testable import AuctionCreation

class MockAuctionServiceSuccess: AuctionService {
    override func get(completion: @escaping ((ServiceResponse<AuctionHolder>) -> Void)) {
        completion(.success(MockModel.auctionHolder))
    }
    
    override func post(parameters: [String : Any], completion: @escaping ((ServiceResponse<String>) -> Void)) {
        completion(.success("1234"))
    }
}
