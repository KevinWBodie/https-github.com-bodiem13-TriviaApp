//
//  PlayGameViewController.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/13/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit
//Create global variables for team names
var dataList = [UInt]()
//var testList = ["Team 1 mike", "Team Mikey", "Team Steph"]
class PlayGameViewController: UIViewController {
    //get list of teams
    //var listOfTeamNames = [String]()
    
    @IBOutlet weak var PlayGameHeader: UILabel!
    
    @IBOutlet weak var EnterTeamInstructions: UITextView!
    
    @IBOutlet weak var teamName: UITextField!
    
    
    @IBAction func addTeam(_ sender: Any) {
        
        if teamName.text != nil{
            testList.append(teamName.text!)
            dataList.append(0)
            teamName.text = ""
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //set background opaque setting for screen
        view.isOpaque = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoToPlay(_ sender: Any) {
    }

    //closes keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
