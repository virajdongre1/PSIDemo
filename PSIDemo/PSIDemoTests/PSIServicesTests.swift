//
//  PSIDemoTests.swift
//  PSIDemoTests
//
//  Created by Viraj Dongre on 02/12/19.
//  Copyright © 2019 Viraj Dongre. All rights reserved.
//

import XCTest
@testable import PSIDemo

class PSIServicesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchPSIData() {
        let apiExpectation = XCTestExpectation(description: "Fetch PSI Data")
        
        PSIServices.fetchPSIData { root in
            XCTAssertNotNil(root)
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3.0)
    }

}
