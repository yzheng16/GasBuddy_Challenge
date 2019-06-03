//
//  GasBuddy_ChallengeTests.swift
//  GasBuddy_ChallengeTests
//
//  Created by Yi Zheng on 2019-06-02.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import XCTest
@testable import GasBuddy_Challenge

class GasBuddy_ChallengeTests: XCTestCase {
    
    func testColor(){
        let red = UIColor(r: 255, g: 0, b: 0)
        XCTAssertEqual(red, .red)
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
