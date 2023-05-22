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

    func testNewRound(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)

    }
    
    func testScoreExact(){
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose(){
        let guess = game.target+1 // не проверит если -1
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 99+50)
    }

    func testRestartGame(){
        game.startNewRound(points: 100)
        
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        
        game.restart()
        
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
        
    }
}
