//
//  ScoreboardViewController.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/28/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit
import TriviaUtilityPackage

class ScoreboardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var instructionsText: UITextView!
    
    @IBOutlet weak var NumberOfQuestions: UITextField!
    var numQuestions = Int()
    var finalNumQuestions = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NumberOfQuestions.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    @IBAction func generateTriviaButton(_ sender: Any) {
        
        if NumberOfQuestions.text != nil{
            let numQuestions = Int(NumberOfQuestions.text!)!
            let finalNumQuestions = questionNumConstraints(numQuestions)
            print("final numQuestions", finalNumQuestions)
                // Put your code which should be executed with a delay here
            TriviaUtilityPackage.shared.generateTriviaFunction(count: finalNumQuestions)
            //TriviaUtilityPackage.shared.generateTriviaFunction(count: finalNumQuestions)
        }
        else{
            let finalNumQuestions = Int(20)
            TriviaUtilityPackage.shared.generateTriviaFunction(count: finalNumQuestions)
        }
    }
    
    func questionNumConstraints(_ value: Int!) -> Int {
        if 1 ... 100 ~= value!
        {
            print(value)
            return value
        }
        else
        {
            let value = Int(20)
            print(value)
            return value
        }
    }
    
    //function to debug variable types
    func printInfo(_ value: Any) {
        let t = type(of: value)
        print("'\(value)' of type '\(t)'")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

}
