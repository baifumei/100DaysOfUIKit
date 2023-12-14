//
//  ViewController.swift
//  Project5
//
//  Created by Екатерина К on 14.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //finding the path to start.txt file
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            //loading the contents of that file
            if let startWords = try? String(contentsOf: startWordsURL) {
                //splitting it into an array
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
    }


}

