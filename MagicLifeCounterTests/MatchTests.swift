//
//  MatchTests.swift
//  MagicLifeCounterTests
//
//  Created by GS on 06/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import XCTest
@testable import MagicLifeCounter

class MatchTests: XCTestCase, GameCheckable {
    private var currentMatch: Match!
    private var firstPlayer: Player!
    private var secondPlayer: Player!
    private var endGameExpectation: XCTestExpectation!
    
    override func setUp() {
        var config = GameConfig()
        config.startingLife = 0
        
        firstPlayer = Player(config, playerName: "Player 1", playerColor: .red)
        secondPlayer = Player(config, playerName: "Player 2", playerColor: .red)
        
        currentMatch = Match(firstPlayer, secondPlayer: secondPlayer, numberOfRounds: .five)
        currentMatch.delegate = self
    }
    
    func testFinishRound() {
        let initialRoundScoreForSecondPlayer = currentMatch.matchScorePlayer2
        currentMatch.endRound()
        
        XCTAssertTrue(currentMatch.matchScorePlayer2 > initialRoundScoreForSecondPlayer)
    }
    
    func testGameIsFinished() {
        currentMatch.matchScorePlayer2 = 2
        currentMatch.endRound()
        
        XCTAssertTrue(currentMatch.matchScorePlayer2 > currentMatch.numberOfRounds.rawValue / 2)
    }
    
    func endGame() {

    }
}
