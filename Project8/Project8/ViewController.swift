//
//  ViewController.swift
//  Project8
//
//  Created by Екатерина К on 25.12.2023.
//

import UIKit

class ViewController: UIViewController {

    var scoreLable: UILabel!
    var cluesLable: UILabel!
    var answersLable: UILabel!
    var currentAnswer: UITextField!
    var lettersButton = [UIButton]()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .cyan
        
        //MARK: - Score
        scoreLable = UILabel()
        scoreLable.translatesAutoresizingMaskIntoConstraints = false
        scoreLable.textAlignment = .right
        scoreLable.text = "Score: 0"
        scoreLable.font = UIFont.systemFont(ofSize: 21)
        view.addSubview(scoreLable)
        
        //MARK: - Clues
        cluesLable = UILabel()
        cluesLable.translatesAutoresizingMaskIntoConstraints = false
        cluesLable.font = UIFont.systemFont(ofSize: 24)
        cluesLable.text = "CLUES"
        cluesLable.numberOfLines = 0
        view.addSubview(cluesLable)
        
        //MARK: - answersLable
        answersLable = UILabel()
        answersLable.translatesAutoresizingMaskIntoConstraints = false
        answersLable.font = UIFont.systemFont(ofSize: 24)
        answersLable.text = "ANSWERS"
        answersLable.textAlignment = .right
        answersLable.numberOfLines = 0
        view.addSubview(answersLable)
        
        //MARK: - currentAnswer
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 40)
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
        //MARK: - Buttons
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        view.addSubview(submit)

        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        view.addSubview(clear)

//        lettersButton = [UIButton]()
//        lettersButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - AutoLayout
        NSLayoutConstraint.activate([
            //метка по полям макета layoutMarginsGuide - (устанавливает ограничения так, чтобы они придерживались отступов макета родительского представления. )
            scoreLable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            cluesLable.topAnchor.constraint(equalTo: scoreLable.bottomAnchor),
            cluesLable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLable.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
            
            answersLable.topAnchor.constraint(equalTo:  scoreLable.bottomAnchor),
            answersLable.trailingAnchor.constraint(equalTo:  view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLable.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            
            answersLable.heightAnchor.constraint(equalTo: cluesLable.heightAnchor),
            
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLable.bottomAnchor, constant: 20),
            
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),
            
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clear.heightAnchor.constraint(equalToConstant: 44),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor)
            
            
        ])
        cluesLable.backgroundColor = .yellow
        answersLable.backgroundColor = .orange
        currentAnswer.backgroundColor = .green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


}

