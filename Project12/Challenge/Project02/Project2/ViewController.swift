//
//  ViewController.swift
//  Project2
//
//  Created by Екатерина К on 24.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 1
    var scoreOfTheGame = UILabel()
    var highestScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //a bar button item that shows their score when tapped (from challenge of project3)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .done, target: self, action: #selector(showScore))

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased() + " " + "\(questionsAsked)/10"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var ac: UIAlertController
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            scoreOfTheGame.text = "Score: \(score)"
        } else {
            title = "Wrong! This is a flag of \(countries[sender.tag].uppercased())"
            score -= 1
            scoreOfTheGame.text = "Score: \(score)"
        }
        questionsAsked += 1
        
        if questionsAsked == 11 {
            ac = UIAlertController(title: "Game over!", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart?", style: .default, handler: askQuestion))
            questionsAsked = 1
            if score > highestScore {
                UserDefaults.standard.set(score, forKey: "highestScore")
                highestScore = score
                ac = UIAlertController(title: "Great job!", message: "You beat your previous record. Now the highest score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            }
            score = 0
        } else {
            ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        present(ac, animated: true)
    }
    
    @objc func showScore() {
        var message =  "\(score)"
        let title = "Your score is"
        let alertControll = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertControll.addAction(UIAlertAction(title: "continue", style: .default))
        present(alertControll, animated: true)
    }
}

