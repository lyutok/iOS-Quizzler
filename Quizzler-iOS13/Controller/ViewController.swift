//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var choice1Button: UIButton!
    @IBOutlet var choice2Button: UIButton!
    @IBOutlet var choice3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //Delay change colors of buttons
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //            self.updateUI()
        //        }
        
        //OR
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        
        choice1Button.backgroundColor = .clear
        choice2Button.backgroundColor = .clear
        choice3Button.backgroundColor = .clear
        
        let buttonsName = quizBrain.getButtonName()
        choice1Button.setTitle(buttonsName[0], for: .normal)
        choice2Button.setTitle(buttonsName[1], for: .normal)
        choice3Button.setTitle(buttonsName[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
    }
}

