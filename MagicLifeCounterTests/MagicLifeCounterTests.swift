//
//  MagicLifeCounterTests.swift
//  MagicLifeCounterTests
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import XCTest
@testable import MagicLifeCounter

class MagicLifeCounterTests: XCTestCase {
    func testLifeIncrement() {
        var p1 = Player(GameConfig(), playerName: "player1", playerColor: ColorType.Red)
        let currentLife = p1.currentLife
        p1.incrementLife()
        XCTAssertTrue(p1.currentLife > currentLife)
    }
    
    func testLifeDecrement() {
        var p1 = Player(GameConfig(), playerName: "player1", playerColor: ColorType.Red)
        let currentLife = p1.currentLife
        p1.decrementLife()
        XCTAssertTrue(p1.currentLife < currentLife)
    }
    
    func testPlayerColor() {
        let p1 = Player(GameConfig(), playerName: "player1", playerColor: ColorType.Red)
        XCTAssertTrue(p1.color == ColorType.Red)
    }
    
    func testResetScore() {
        var p1 = Player(GameConfig(), playerName: "player1", playerColor: ColorType.Red)
        p1.incrementLife()
        p1.incrementLife()
        p1.incrementLife()
        
        p1.resetPlayerScore()
        XCTAssertTrue(p1.currentLife == GameConfig().startingLife)
    }
    
    func resetUserDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    func testConfigNewDice() {
        resetUserDefaults()
        var config = GameConfig()
        config.diceType = DiceType.tenSides
        var newConfig = GameConfig()
        
        XCTAssertTrue(newConfig.diceType == DiceType.tenSides)
    }
    
    func testConfigNewStartLife() {
        resetUserDefaults()
        var config = GameConfig()
        config.startingLife = 40
        var newConfig = GameConfig()
        
        XCTAssertTrue(newConfig.startingLife == 40)
    }
    
    func testMatchScoreIncrease() {
        let p1 = Player(GameConfig(), playerName: "player1", playerColor: ColorType.Red)
        let p2 = Player(GameConfig(), playerName: "player2", playerColor: ColorType.Red)
        var match = Match(p1, secondPlayer: p2, numberOfRounds: NumberOfRounds.three)
        XCTAssertTrue(match.matchScorePlayer1 == 0)
        match.increaseScorePlayerOne()
        XCTAssertTrue(match.matchScorePlayer1 == 1)
    }
    
    func testMatchHasEnded() {
        let p1 = Player(GameConfig(), playerName: "player1", playerColor: ColorType.Red)
        let p2 = Player(GameConfig(), playerName: "player2", playerColor: ColorType.Red)
        var match = Match(p1, secondPlayer: p2, numberOfRounds: NumberOfRounds.three)
        XCTAssertTrue(match.matchScorePlayer1 == 0)
        match.increaseScorePlayerOne()
        match.increaseScorePlayerOne()
        match.increaseScorePlayerOne()
        XCTAssertTrue(match.matchScorePlayer1 == 3)
        XCTAssertTrue(match.gameHasEnded().0 == true)
    }
}
