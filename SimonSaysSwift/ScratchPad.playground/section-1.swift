// Playground - noun: a place where people can play

import Cocoa

var buttonArray = Array(1...4)

let newButton = Int(arc4random_uniform(UInt32(4))) + 1



buttonArray.append(5)



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

var gameModelTest = GameModel()
gameModelTest.startRound()
gameModelTest.startRound()
gameModelTest.startRound()
gameModelTest.startRound()


















