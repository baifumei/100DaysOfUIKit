//
//  ViewController.swift
//  Project2
//
//  Created by Екатерина К on 24.11.2023.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    var scoreOfTheGame = UILabel()
    
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
        registerNotification()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5) {
            self.button1.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.button2.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.button3.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        title = countries[correctAnswer].uppercased() + " " + "\(questionsAsked)/10"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var ac: UIAlertController
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
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
        
        if questionsAsked == 10 {
            ac = UIAlertController(title: "Game over!", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart?", style: .default, handler: askQuestion))
            questionsAsked = 0
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
    
    func registerNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted , error) in
            if granted {
//                center.removeAllPendingNotificationRequests()
                center.delegate = self
                let content = UNMutableNotificationContent()
                content.title = "Do you know this flag?"
                content.body = "New daily challenge is available"
                content.categoryIdentifier = "alarm"
                content.userInfo = ["customData": "fizzbuzz"]
                content.sound = .defaultRingtone
                //86400
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
            } else {
                print("no")
            }
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("customData: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                print("Default identifier")
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                registerNotification()
            default:
                print("break")
                break
            }
        }
        completionHandler()
    }
    
}

