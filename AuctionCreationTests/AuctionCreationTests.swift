//
//  AuctionCreationTests.swift
//  AuctionCreationTests
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import XCTest
@testable import AuctionCreation

class AuctionCreationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let service = AuctionService()
        let serviceExpectation = expectation(description: "Service call")
        let endpoint = "https://private-8fa34-auctioncreation.apiary-mock.com/auction"
        service.get(url: endpoint, headers: ["Bearer": "Y2Q4MjYwM2MtYmRmMC00OTNiLWEzZTItNmM2OWZhYzM3NWI3"]) { (response) in
            if case .success(let auction) = response {
                print(auction)
                serviceExpectation.fulfill()
                return
            }
            
            XCTFail("Service request failed")
        }
        wait(for: [serviceExpectation], timeout: 5.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
