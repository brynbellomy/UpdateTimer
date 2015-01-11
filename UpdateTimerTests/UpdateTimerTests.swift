//
//  UpdateTimerTests.swift
//  UpdateTimerTests
//
//  Created by bryn austin bellomy on 2014 Dec 30.
//  Copyright (c) 2014 bryn austin bellomy. All rights reserved.
//

import Cocoa
import XCTest
import UpdateTimer


class UpdateTimerTests: XCTestCase
{
    var updateTimer: UpdateTimer?

    override func setUp()
    {
        super.setUp()
        updateTimer = UpdateTimer()
    }

    func testNewTimerProperties()
    {
        XCTAssert(updateTimer?.frameCount == 0)
        XCTAssert(updateTimer?.timeSinceFirstUpdate == 0)
        XCTAssert(updateTimer?.timeSinceLastUpdate == 0)
        XCTAssert(updateTimer?.timeSinceLastLap == 0)
    }

    func testTimeSinceLastUpdate()
    {
        updateTimer?.update(5)
        XCTAssert(updateTimer?.timeSinceLastUpdate == 0)
        updateTimer?.update(10)
        XCTAssert(updateTimer?.timeSinceLastUpdate == 5)
        updateTimer?.update(15)
        XCTAssert(updateTimer?.timeSinceLastUpdate == 5)
    }

    func testTimeSinceFirstUpdate()
    {
        updateTimer?.update(5)
        XCTAssert(updateTimer?.timeSinceFirstUpdate == 0)
        updateTimer?.update(10)
        XCTAssert(updateTimer?.timeSinceFirstUpdate == 5)
        updateTimer?.update(15)
        XCTAssert(updateTimer?.timeSinceFirstUpdate == 10)
    }

    func testTimeSinceLastLap()
    {
        // test the actual lap timer value
        updateTimer?.lap()
        XCTAssert(updateTimer!.timeSinceLastLap == 0)
        updateTimer?.update(5)
        XCTAssertEqual(updateTimer!.timeSinceLastLap, 0)
        updateTimer?.update(10)
        XCTAssertEqual(updateTimer!.timeSinceLastLap, 5)
        updateTimer?.update(15)
        XCTAssertEqual(updateTimer!.timeSinceLastLap, 10)

        updateTimer?.lap()
        XCTAssertEqual(updateTimer!.timeSinceLastLap, 0)
        updateTimer?.update(20)
        XCTAssertEqual(updateTimer!.timeSinceLastLap, 5)
        XCTAssertEqual(updateTimer!.timeSinceFirstUpdate, 15)
    }

    func testFrameCount()
    {
        XCTAssert(updateTimer?.frameCount == 0)
        updateTimer?.update(5)
        XCTAssert(updateTimer?.frameCount == 1)
        updateTimer?.update(10)
        XCTAssert(updateTimer?.frameCount == 2)
        updateTimer?.update(15)
        XCTAssert(updateTimer?.frameCount == 3)

    }
}
