//
//  MockAuctionView.swift
//  AuctionCreationTests
//
//  Created by Santiago Carmona Gonzalez on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation
@testable import AuctionCreation

class MockAuctionView: AuctionView {
    var displayClosure: ((AuctionViewModel) -> Void)?
    var showClosure: ((String) -> Void)?
    
    func display(_ viewModel: AuctionViewModel) {
        displayClosure?(viewModel)
    }
    
    func show(id: String) {
        showClosure?(id)
    }
}
