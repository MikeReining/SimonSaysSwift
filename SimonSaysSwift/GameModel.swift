//
//  GameModel.swift
//  SimonSaysSwift
//
//  Created by Michael Reining on 1/21/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import Foundation

class GameModel {
    var buttonCombination: Array<Int> = []
    var round = 1
    init() {
        self.buttonCombination = []
    }
    
    func startRound() -> [Int] {
        buttonCombination.removeAll(keepCapacity: false)
        for i in 1...round {
            var nextButtonTag = Int(arc4random_uniform(UInt32(4))) + 1
            buttonCombination.append(nextButtonTag)
        }
        round += 1
        return buttonCombination
    }
}

