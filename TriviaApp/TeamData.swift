//
//  TeamData.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/30/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import Foundation

//Create TeamData object for scoreboard data
class TeamData{
    
    //Create teamName and teamScore variables to hold scoreboard data
    var teamName: String
    var teamScore: Int
    
    init(teamName: String, teamScore: Int){
        //initialize teamName and teamScore within the TeamData object
        self.teamName = teamName
        self.teamScore = teamScore
    }
    
}
