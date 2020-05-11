//
//  ScoreboardCell.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/30/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit

protocol CustomCellUpdater: class { // the name of the protocol you can put any
    func updateTableView()
}

//relating to stack overflow example
typealias ButtonHandler = (ScoreboardCell) -> Void

class ScoreboardCell: UITableViewCell {
    
    weak var scoreDelegate: CustomCellUpdater!

    //relating to stack overflow example
    var incrementHandler: ButtonHandler?
    var decrementHandler: ButtonHandler?
    
    @IBOutlet weak var TeamName: UILabel!
    @IBOutlet weak var TeamScore: UILabel!
    var currentScore = Int()
    
    func configureWithValue(value: UInt, incrementHandler: ButtonHandler?, decrementHandler: ButtonHandler?) {
        TeamScore.text = String(value)
        self.incrementHandler = incrementHandler
        self.decrementHandler = decrementHandler
    }
    
    
    //initialize AddOne button to add one to current score
    @IBAction func AddOneToScore(_ sender: Any) {
        incrementHandler?(self)
        
        
        //commented below
//        currentScore += 1;
//        self.TeamScore.text = "\(currentScore)"
        //scoreDelegate.updateTableView()
        
    }
    
    @IBAction func MinusOneToScore(_ sender: Any) {
        decrementHandler?(self)
        
        
        //commented below cells
//        if (currentScore != 0){
//            currentScore -= 1;
//        }
//        self.TeamScore.text = "\(currentScore)"
        
    }
    
    
    
//    @IBAction func AddOne(_ sender: UIButton) {
//
//        //increment score and update TeamScore label
//        currentScore += 1;
//        self.TeamScore.text = "\(currentScore)"
//
//    }
    
    
    func setName(nameOfTeam: String){
        TeamName.text = nameOfTeam
    }
    func setScore(beginScore: Int){
        TeamScore.text = String(currentScore)
    }
    
    
    

}
