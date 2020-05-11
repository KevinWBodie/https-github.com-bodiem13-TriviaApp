//
//  ViewController.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/5/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Connect image and label objects
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var menuHeader: UILabel!
    
    
    //MKB commented out var TestJson since logic was copied into the last function
    var testJson = ""
    
    

    override func viewDidLoad() {
        //testList = [String]()
        super.viewDidLoad()
        
        //MKB COMMENTED FOR TEST
        //definesPresentationContext = true
        // Do any additional setup after loading the view.
    }

    @IBAction func playGame(_ sender: Any) {
        testList = [String]()
        dataList = [UInt]()
    }
    
    
    @IBAction func howToPlay(_ sender: Any) {
        
    }
    
    @IBAction func viewPastResults(_ sender: Any) {
        print("Past results will be displayed")
        
    }
    
}

