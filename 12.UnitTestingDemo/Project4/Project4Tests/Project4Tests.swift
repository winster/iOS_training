//
//  Project4Tests.swift
//  Project4Tests
//
//  Created by winster jose on 26/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import XCTest

class Project4Tests: XCTestCase {
    
    var testController : ViewController?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testController = ViewController()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testController = nil
    }
    
    func testGetName(){
        let expectedValue = "Jose"
        let testData = 1
        let actualValue = testController!.getName(testData)
        
        XCTAssertEqual(expectedValue, actualValue, "expectedValue \(expectedValue) is not equal to actualValue \(actualValue)")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
