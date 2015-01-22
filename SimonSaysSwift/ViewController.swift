//
//  ViewController.swift
//  SimonSaysSwift
//
//  Created by Michael Reining on 1/21/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    var gameModel: GameModel?
    var buttonCombinationForRound: [Int]?
    
    @IBAction func startGameButtonPressed(sender: AnyObject) {
        buttonCombinationForRound = gameModel!.nextRound()

        showNextButton(&gameModel!)
        
    }
    
    
    @IBAction func colorButtonPressed(sender: AnyObject) {
        var buttonPressedTag = sender.tag
        println("Button Tag = \(buttonPressedTag)")
        gameModel?.buttonsPressed.append(buttonPressedTag)
        var buttonPressedAtIndex = gameModel!.buttonsPressed.count - 1
        var currentButtonPressed = gameModel!.buttonsPressed[buttonPressedAtIndex]
        var currentButtonInSequence = buttonCombinationForRound![(buttonPressedAtIndex)]
        if currentButtonPressed != currentButtonInSequence {
            println("WRONG answer - you lost")
            let message = "Try again."
            let alert = UIAlertController(title: "GAME OVER", message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Doh!", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        } else {
            if gameModel!.buttonsPressed.count == buttonCombinationForRound!.count {
                println("You passed this round!")
                let message = "You passed round \(gameModel!.round)!"
                let alert = UIAlertController(title: "SUCCESS", message: message, preferredStyle: .Alert)
                let action = UIAlertAction(title: "Let's Play Again!", style: .Default, handler: nil)
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                gameModel!.buttonsPressed.removeAll(keepCapacity: false)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel = GameModel()
        blueButton.backgroundColor = UIColor.blueColor()
        blueButton.alpha = 0.5
        greenButton.backgroundColor = UIColor.greenColor()
        greenButton.alpha = 0.5
        redButton.backgroundColor = UIColor.redColor()
        redButton.alpha = 0.5
        orangeButton.backgroundColor = UIColor.orangeColor()
        orangeButton.alpha = 0.5
        self.view.backgroundColor = UIColor.blackColor()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateGreenButton() {
        UIView.animateWithDuration(0.2,
            delay: 0.4,
            options: .CurveEaseInOut,
            animations: {
                self.greenButton.alpha = 1.0
            },
            completion: { finished in
                println("Green Button Highlighted!")
                self.showNextButton(&self.gameModel!)
                
        })
    }
    func animateBlueButton() {
        UIView.animateWithDuration(0.2,
            delay: 0.4,
            options: .CurveEaseInOut,
            animations: {
                self.blueButton.alpha = 1.0
            },
            completion: { finished in
                println("Blue Button Highlighted!")
                self.showNextButton(&self.gameModel!)
        })
    }
    func animateRedButton() {
        UIView.animateWithDuration(0.2,
            delay: 0.4,
            options: .CurveEaseInOut,
            animations: {
                self.redButton.alpha = 1.0
            },
            completion: { finished in
                println("Red Button Highlighted!")
                self.showNextButton(&self.gameModel!)
        })
    }
    func animateOrangeButton() {
        UIView.animateWithDuration(0.2,
            delay: 0.4,
            options: .CurveEaseInOut,
            animations: {
                self.orangeButton.alpha = 1.0
            },
            completion: { finished in
                println("Orange Button Highlighted!")
                self.showNextButton(&self.gameModel!)
                
        })
    }
    
    func showNextButton(inout gameModel: GameModel) {
        self.greenButton.alpha = 0.3
        self.blueButton.alpha = 0.3
        self.redButton.alpha = 0.3
        self.orangeButton.alpha = 0.3
        if gameModel.buttonCombination.count >= 1 {
            var nextButton = gameModel.buttonCombination[0] as Int
            switch nextButton {
            case 1:
                animateBlueButton()
            case 2:
                animateGreenButton()
            case 3:
                animateRedButton()
            case 4:
                animateOrangeButton()
            default:
                println("Do nothing")
            }
            gameModel.buttonCombination.removeAtIndex(0)
        }
    }
}

