// Playground - noun: a place where people can play

import Cocoa

class GameModel {
    var buttonCombination: Array<Int> = []
    var buttonsPressed: Array<Int> = []
    var round = 3
    init() {
        self.buttonCombination = []
        self.buttonsPressed = []
        //super.init()
    }
    
    
    
    func nextRound() -> [Int] {
        buttonCombination.removeAll(keepCapacity: false)
        for i in 1...round {
            var nextButtonTag = Int(arc4random_uniform(UInt32(4))) + 1
            buttonCombination.append(nextButtonTag)
        }
        round += 1
        return buttonCombination
    }
    
}

var gameModel = GameModel()

gameModel.nextRound()
gameModel.buttonCombination















