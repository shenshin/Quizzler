//
//  ViewController.swift
//  Quizzler
//
//  Created by Ales Shenshin on 15/12/2018.
//  Copyright (c) 2018 Shenshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var numberOfQuestions : Int = 0
    var currentQuestion : Int = 0
    var pickedAnswer : Bool = false
    var score : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        numberOfQuestions = allQuestions.list.count
        
        let firstQuestion = allQuestions.list[currentQuestion]
        questionLabel.text = firstQuestion.questionText
        updateUI()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
            if sender.tag == 1 {
                pickedAnswer = true
            }
            else if sender.tag == 2 {
                pickedAnswer = false
            }
        
            checkAnswer()
        
            currentQuestion += 1
        
            nextQuestion()
        
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(currentQuestion + 1) / \(numberOfQuestions)"
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(numberOfQuestions)) * CGFloat(currentQuestion + 1)
        questionLabel.text = allQuestions.list[currentQuestion].questionText
    }
    

    func nextQuestion() {
        
        if currentQuestion < numberOfQuestions {
            updateUI()
            
        } else {
            let alert = UIAlertController(title: "Awsome", message: "You gave \(score) correct answers to \(numberOfQuestions) questions. Do you want to try once more?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default)
            { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer : Bool = allQuestions.list[currentQuestion].answer
        if pickedAnswer == correctAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
            updateUI()
        } else {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    func startOver() {
        currentQuestion = 0
        score = 0
        updateUI()
        nextQuestion()
    }
    

    
}
