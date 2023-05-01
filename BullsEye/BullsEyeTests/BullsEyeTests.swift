//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Vodnikova Daria Konstantinovna on 01.05.2023.
//

import XCTest
@testable import BullsEye

final class BullsEyeTests: XCTestCase {

    var game : Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive(){
        let guess = game.target+5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative(){
        let guess = game.target-5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}
