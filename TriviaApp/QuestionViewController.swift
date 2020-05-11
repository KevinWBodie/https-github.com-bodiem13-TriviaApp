//
//  QuestionViewController.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/16/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit
import TriviaUtilityPackage

//RUNNING CODE WITH ANSWER IN SEPARATE VIEW CONTROLLER

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    var questionNum = Int(1)
    var secondResultLabelText : String!
    var sendAnswer = String()
    
    var questionOneTest = "What is my favorite food?"


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.questionTextView.layer.borderWidth = 1.0;
        //self.questionTextView.layer.cornerRadius = 8;
        //self.questionNumber.text = ("Question " +  String(questionNum))
        //questionNumber.text = secondResultLabelText
        // Do any additional setup after loading the view.
    }
    @IBAction func goToAnswer(_ sender: Any) {
        //self.questionNumber.text = String("Question " + String(questionNum + 1))
    }
    
    @IBAction func endGame(_ sender: Any) {
    }
    

    //Attempt at a function to increment a value each time a view controller is visited.
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        var visitCount = (UserDefaults.standard.value(forKey:  "visitCount") as? Int) ?? 0
//        visitCount += 1

        //self.questionNumber.text = "Question \(visitCount)"
        //TriviaUtilityPackage.shared.generateTriviaFunction(count: 10)
        questionOneTest = TriviaUtilityPackage.shared.getTriviaQuestion(index: (questionNum - 1))
        sendAnswer = TriviaUtilityPackage.shared.getTriviaAnswer(index: (questionNum-1))
        self.questionTextView.text = questionOneTest
        //questionOneTest = TriviaUtilityPackage.shared.getTriviaAnswer()
        self.questionNumber.text = "Question \(questionNum)"

        //UserDefaults.standard.set(visitCount, forKey: "visitCount")
    }
    
    
    //Function to pass the question from questionViewController to AnswerViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "questionToAnswer" {
                let vc = segue.destination as! AnswerViewController
            
                //Pass the question text to AnswerViewController
                vc.testLabelText = questionOneTest
            vc.answerToQuestion = sendAnswer
                //Pass question number to AnswerViewController to be incremented
                vc.answerNum = questionNum
           }
       }


}
