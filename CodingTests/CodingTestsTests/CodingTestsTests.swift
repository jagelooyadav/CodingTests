//
//  CodingTestsTests.swift
//  CodingTestsTests
//
//  Created by Jageloo Yadav on 26/11/21.
//

import XCTest
@testable import CodingTests

class CodingTestsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testsBinarySearch() {
        XCTAssertTrue(BinarySearch().searchUsingBinary(array: [1], target: 1) == 0)
        XCTAssertTrue(BinarySearch().searchUsingBinary(array: [1], target: 2) == -1)
        XCTAssertTrue(BinarySearch().searchUsingBinary(array: [1, 2, 3], target: 2) == 1)
        XCTAssertTrue(BinarySearch().searchUsingBinary(array: [1, 2, 4], target: 5) == -1)
        XCTAssertEqual(BinarySearch().searchUsingBinary(array: [1, 2, 4], target: 1), 0)
        XCTAssertEqual(BinarySearch().searchUsingBinary(array: [1, 3, 4, 5,6], target: 1), 0)
        XCTAssertEqual(BinarySearch().searchUsingBinary(array: [1, 3, 4, 5,6], target: 3), 1)
        XCTAssertEqual(BinarySearch().searchUsingBinary(array: [1, 3, 4, 5,6], target: 4), 2)
        XCTAssertEqual(BinarySearch().searchUsingBinary(array: [1, 3, 4, 5,6], target: 5), 3)
        XCTAssertEqual(BinarySearch().searchUsingBinary(array: [1, 3, 4, 5,6], target: 6), 4)
        
        XCTAssertEqual(BinarySearch().searchUsingBinary(array: [-1, -3, -4, 5,6], target: -4), 2)
    }
    
    func testBadVersion() {
        XCTAssertEqual(Solution().firstBadVersion(Int.max - 1), 1702766719)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
