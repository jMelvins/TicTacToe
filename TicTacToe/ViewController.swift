//
//  ViewController.swift
//  TicTacToe
//
//  Created by Vladislav Shilov on 15.05.17.
//  Copyright © 2017 Vladislav Shilov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //cross
    var gameState = [0,0,0, 0,0,0, 0,0,0]
    var gameIsActive = true
    var crossWins = 0
    var noughtWins = 0
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6] ,[1,4,7] ,[2,5,8] ,[0,4,8] ,[2,4,6]]
    
    @IBOutlet weak var noughtLabel: UILabel!
    @IBOutlet weak var crossLabel: UILabel!
    @IBOutlet weak var hasWonLabel: UILabel!
    
    @IBAction func btnAction(_ sender: AnyObject) {
            
        
        if gameState[sender.tag-1] == 0 && gameIsActive{
            
            gameState[sender.tag-1] = activePlayer
            
            if activePlayer == 1{
                sender.setImage(#imageLiteral(resourceName: "Cross"), for: UIControlState())
                activePlayer = 2
            } else{
                sender.setImage(#imageLiteral(resourceName: "Nought"), for: UIControlState())
                activePlayer = 1
            }
        
        
            for combination in winningCombinations{
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    gameIsActive = false
                    
                    if gameState[combination[0]] == 1{
                        //cross has won
                        print("cross")
                        hasWonLabel.text = "Cross has won!"
                        crossWins += 1
                        crossLabel.text = String(crossWins)
                    } else {
                        //nought has won
                        print("nought")
                        hasWonLabel.text = "Nought has won!"
                        noughtWins += 1
                        noughtLabel.text = String(noughtWins)
                    }
                    
                    playAgainBtn.isHidden = false
                    hasWonLabel.isHidden = false
                }
            }
        }
        
        var count = 1
        
        if gameIsActive{
            for i in gameState{
                count = i*count
            }
            if count != 0 {
                hasWonLabel.text = "IT WAS A DRAW"
                hasWonLabel.isHidden = false
                playAgainBtn.isHidden = false
            }

        }
        
    }
    
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
        playAgainBtn.isHidden = true
        hasWonLabel.isHidden = true
        
        gameIsActive = true
        gameState = [0,0,0, 0,0,0, 0,0,0]
        activePlayer = 1
        
        for i in 1...9{
            let btn = view.viewWithTag(i) as! UIButton
            btn.setImage(nil, for: UIControlState())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

