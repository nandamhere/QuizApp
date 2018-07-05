//
//  ViewController.swift
//  QuizApp
//
//  Created by Vaibhav Nandam on 7/5/18.
//  Copyright © 2018 Vaibhav Nandam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = true
    var questionNum : Int = 0
    var scoreCount : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestions.list[0].questionText
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == 1{
            pickedAnswer = true
        }else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        updateUI()
        questionNum = questionNum + 1
        nextQuestion()
        
        
    }
    func updateUI() {
        scoreLabel.text = "Score:\(scoreCount)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNum + 1)
        progressLabel.text = "\(questionNum + 1)/13"
        
    }
    
    
    func nextQuestion() {
        if questionNum <= 12{
            questionLabel.text = allQuestions.list[questionNum].questionText
        }else {
            let alert = UIAlertController(title: "Awesome!", message: "finished all questions wanna start over??", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
            
            
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNum].answer
        if correctAnswer == pickedAnswer{
            scoreCount = scoreCount + 1
            ProgressHUD.showSuccess("Corret")
        }else {
            ProgressHUD.showError("wrong")
        }
        
    }
    
    
    func startOver() {
        
        questionNum = 0
        scoreCount = 0
        updateUI()
        nextQuestion()
        
    }
    
    
    
}


