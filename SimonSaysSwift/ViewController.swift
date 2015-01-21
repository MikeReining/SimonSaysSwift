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
    
    @IBAction func startGameButtonPressed(sender: AnyObject) {
        showButtonCombination()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel?.startRound()
        blueButton.backgroundColor = UIColor.blueColor()
        blueButton.alpha = 0.5
        greenButton.backgroundColor = UIColor.greenColor()
        greenButton.alpha = 0.5
        redButton.backgroundColor = UIColor.redColor()
        redButton.alpha = 0.5
        orangeButton.backgroundColor = UIColor.orangeColor()
        orangeButton.alpha = 0.5
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showButtonCombination() {
        var buttonCombination = [1,2]
        for buttonTag in buttonCombination {
            switch buttonTag {
            case 1:
                println("button 1 should highlight")
            case 2:
                println("button 1 should highlight")

            case 3:
                println("button 1 should highlight")

            case 4:
                println("button 1 should highlight")

            default:
                println("Do nothing")
            }
        }
    }


}

