//
//  AuctionPresenterTests.swift
//  
//
//  Created by Santiago Carmona Gonzalez on 9/4/19.
//

import XCTest
@testable import AuctionCreation

class AuctionPresenterTests: XCTestCase {
    
    // MARK: - Vars & Constants
    
    let auctionView = MockAuctionView()
    var presenter: AuctionPresenter!

    override func setUp() {
    }

    override func tearDown() {
    }

    func testDisplayAuctionViewModel() {
        let serviceExpectation = expectation(description: "Display method should be called on the view")
        let expectedViewModelTitle = "TEST"
        presenter = AuctionPresenter(view: auctionView)
        presenter.service = MockAuctionServiceSuccess()
        
        auctionView.displayClosure = { (viewModel) in
            XCTAssertEqual(viewModel.title, expectedViewModelTitle)
            serviceExpectation.fulfill()
        }
        
        presenter.fetchAuction()
        
        
        wait(for: [serviceExpectation], timeout: 0.1)
    }
    
    func testShowId() {
        let serviceExpectation = expectation(description: "ShowId method should be called on the view")
        let expectedId = "1234"
        presenter = AuctionPresenter(view: auctionView)
        presenter.service = MockAuctionServiceSuccess()
        presenter.auctionHolder = MockModel.auctionHolder
        
        auctionView.showClosure = { (id) in
            XCTAssertEqual(id, expectedId)
            serviceExpectation.fulfill()
        }
        
        presenter.post()
        
        wait(for: [serviceExpectation], timeout: 0.1)
    }
    
    func testUpdateAuction() {
        let expectedTitle = "Update test"
        let auctionHolder = MockModel.auctionHolder
        var updatedAuction = MockModel.auctionHolder.auction
        
        updatedAuction.title = expectedTitle
        
        presenter = AuctionPresenter(view: auctionView)
        presenter.auctionHolder = auctionHolder
        
        presenter.updateAuctionHolder(with: updatedAuction)
        XCTAssertEqual(expectedTitle, presenter.auctionHolder?.auction.title)
    }
}
