//
//  _b1sTests.swift
//  2b1sTests
//
//  Created by Kirby on 6/1/17.
//  Copyright © 2017 Kirby. All rights reserved.
//

import XCTest
@testable import _b1s

class TestTime: TimeKeeper {
  var now = Date()
}

class _b1sTests: XCTestCase {
    
  func testTimer () {
    let testTimeKeeper = TestTime()
    
    var timeCounter = TimeCounter(eventTime: 10, timeKeeper: testTimeKeeper)
    XCTAssertEqual(timeCounter.currentTimeLeft, 10)
    XCTAssertFalse(timeCounter.isRunning)
    
    timeCounter.start()
    XCTAssert(timeCounter.isRunning)
    testTimeKeeper.now += 1
    XCTAssertEqual(timeCounter.currentTimeLeft, 9)
    
    
    
    timeCounter.reset(newTime: 20)
    XCTAssertTrue(timeCounter.isRunning)
    XCTAssertEqual(timeCounter.currentTimeLeft, 20)
    testTimeKeeper.now += 8
    XCTAssertEqual(timeCounter.currentTimeLeft, 12)
    
  }
    
}
