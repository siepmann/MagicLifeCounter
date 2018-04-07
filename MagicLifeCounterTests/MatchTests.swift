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
        firstPlayer = Player(GameConfig(), playerName: "Player 1", playerColor: .red)
        secondPlayer = Player(GameConfig(), playerName: "Player 2", playerColor: .red)
        
        currentMatch = Match(firstPlayer, secondPlayer: secondPlayer, numberOfRounds: .five)
        currentMatch.delegate = self
    }
    
    func testFinishRound() {
        let initialRoundScoreForSecondPlayer = currentMatch.matchScorePlayer2
        currentMatch.player1.currentLife = 0
        currentMatch.endRound()
        
        XCTAssertTrue(currentMatch.matchScorePlayer2 > initialRoundScoreForSecondPlayer)
    }
    
    func testGameIsFinished() {
        currentMatch.matchScorePlayer2 = 2
        currentMatch.player1.currentLife = 0
        currentMatch.endRound()
        XCTAssertTrue(currentMatch.matchScorePlayer2 > currentMatch.numberOfRounds.rawValue / 2)
    }
    
    func endGame() {

    }
}
