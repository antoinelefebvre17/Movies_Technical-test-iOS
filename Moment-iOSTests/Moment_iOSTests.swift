//
//  Moment_iOSTests.swift
//  Moment-iOSTests
//
//  Created by Antoine Lefebvre on 30/05/2020.
//  Copyright © 2020 Antoine Lefebvre. All rights reserved.
//

import XCTest
@testable import Moment_iOS

class Moment_iOSTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let test = DataMovies()
        
        test.loadMooviesFromAPI()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
