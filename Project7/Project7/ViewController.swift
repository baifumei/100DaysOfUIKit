//
//  ViewController.swift
//  Project7
//
//  Created by Екатерина К on 19.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var findingWords = ""
    var filtedPetitions: [Petition] {
        if findingWords.isEmpty {
            return petitions
        } else {
            return petitions.filter {
                $0.title.contains(findingWords)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString: String
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "doc"), style: .plain, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearch))
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        showError()
    }
    
    
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    
    //MARK: - Search
    @objc func showSearch() {
        let ac = UIAlertController(title: "Search in petitions", message: "Enter text, that must be in the title of a petition", preferredStyle: .alert)
        ac.addTextField()
        let action = UIAlertAction(title: "Continue", style: .cancel) { [weak self, weak ac] _ in
            //
            guard let search = ac?.textFields?[0].text else { return }
            self?.findingWords = search
            self?.tableView.reloadData()
        }
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    
    //MARK: - Credits
    @objc func showCredits() {
        let ac = UIAlertController(title: "Source", message: "Data comes from the We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "I see", style: .cancel))
        present(ac, animated: true)
    }
    
    
    //MARK: - Decoder
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    
    //MARK: - tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtedPetitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = filtedPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = DetailViewController()
        ac.detailItem = filtedPetitions[indexPath.row]
        navigationController?.pushViewController(ac, animated: true)
    }
}

