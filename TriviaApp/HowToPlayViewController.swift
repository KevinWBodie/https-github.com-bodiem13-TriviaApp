//
//  HowToPlayViewController.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/6/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit


class HowToPlayViewController: UIViewController {
    ////removed textview to add tableview
    //@IBOutlet weak var howToPlay: UITextView!
    
    @IBOutlet weak var howToPlay: UITextView!
    
    var list1 = [String]()
    //var updateText = String()
    
    var finalJson = String()
    var testJson = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //finalJson = "This is where the instructions will print."
        //self.howToPlay.layer.borderColor = [[UIColor, grayColor], CGColor];
        
        //sets rounded edges for howToPlay text view
        //self.howToPlay.layer.borderWidth = 1.0;
        //self.howToPlay.layer.cornerRadius = 8;
        
        //view.backgroundColor = .lightGray
        view.isOpaque = false
        self.preferredContentSize = CGSize(width: 100, height: 100)
        
        //change how to play text to testJSON
        //howToPlay.text = finalJson
        //print(finalJson + "This is the final Json")
        

        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func returnMainMenu() {
        
        dismiss(animated: true, completion: nil)
    }

}
