//
//  AnswerViewController.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/16/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var Answer: UILabel!
    var testLabelText = String()
    var answerNum = Int()
    var answerToQuestion = String()
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!
    
    @IBOutlet weak var questionNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add border to questionTextView
        //self.questionTextView.layer.borderWidth = 1.0;
        //self.questionTextView.layer.cornerRadius = 8;
        //add border to answerTextView
        self.answerTextView.layer.borderWidth = 1.0;
        self.answerTextView.layer.cornerRadius = 8;
        
        //Answer.text = "Question \(answerNum)"
        questionNumber.text = String(answerNum)
        // Do any additional setup after loading the view.
    }
    @IBAction func nextQuestion(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //answerToQuestion = "Pizza"
        self.answerTextView.text = answerToQuestion
        self.questionNumber.text = "Answer"
        self.questionTextView.text = testLabelText
        self.Answer.text = "Question \(answerNum)"

            //UserDefaults.standard.set(visitCount, forKey: "visitCount")
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answerToScoreboard" {
            let vc = segue.destination as! ReadyToPlayViewController
            //vc.secondResultLabelText = "Testing"
            //Send question number incremented back to QuestionViewController
            vc.questionNumberSaver = (answerNum + 1)
            print(answerNum + 1)
        }
        
    //commented function below works to send the question number back to the question viewcontroller
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToNextQuestion" {
//            let vc = segue.destination as! QuestionViewController
//            vc.secondResultLabelText = "Testing"
//            //Send question number incremented back to QuestionViewController
//            vc.questionNum = (answerNum + 1)
//        }
        
    }

}
