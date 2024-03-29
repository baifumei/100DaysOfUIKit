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
    
    let LEFT_BAR_BUTTON_ITEM_TAG = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add + in rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(startGame))
        leftBarButtonItem.tag = LEFT_BAR_BUTTON_ITEM_TAG
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
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
        
        if let savedWords =  UserDefaults.standard.object(forKey: "usedWords") as? Data {
            do {
                usedWords = try JSONDecoder().decode([String].self, from: savedWords)
                tableView.reloadData()
            } catch {
                print("Failed to load the usedWords")
            }
        }
        
        startGame(UIBarButtonItem())
    }

    @objc func startGame(_ sender: UIBarButtonItem) {
        title = sender.tag == LEFT_BAR_BUTTON_ITEM_TAG ? allWords.randomElement() : UserDefaults.standard.string(forKey: "lastWord") ?? allWords.randomElement()
        UserDefaults.standard.set(title, forKey: "lastWord")

        
        if sender.tag == LEFT_BAR_BUTTON_ITEM_TAG {
            usedWords.removeAll(keepingCapacity: true)
            if let savedData = try? JSONEncoder().encode(usedWords) {
                UserDefaults.standard.set(savedData, forKey: "usedWords")
            } else {
                print("Failed to save words")
            }
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String ) {
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(answer, at: 0)
                    if let savedData = try? JSONEncoder().encode(usedWords) {
                        UserDefaults.standard.set(savedData, forKey: "usedWords")
                    } else {
                        print("Failed to save data")
                    }
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    return
                } else {
                    showErrorMessage(title: "Word not recognised or shorter than three letters", message: "You can't just make them up, you know!")
                }
            } else {
                showErrorMessage(title: "Word used already", message: "Be more original!")
            }
        } else {
            guard let title = title?.lowercased() else { return }
            showErrorMessage(title: "Word not possible", message: "You can't spell that word from \(title) or use \(title) as answer")
            }
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        if word == tempWord { return false }
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
            let checker = UITextChecker()
            //scane our word from 1 letter to the last
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            
            return misspelledRange.location == NSNotFound && word.utf16.count >= 3
    }
    
    func showErrorMessage(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}
