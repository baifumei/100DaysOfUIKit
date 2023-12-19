//
//  ViewController.swift
//  Milestone2
//
//  Created by Екатерина К on 19.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    var allGoods = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Shopping list"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGoods))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearList))
        
        let share = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareList))
        toolbarItems = [share]
        navigationController?.isToolbarHidden = false

    }
    
    //MARK: - add
    @objc func addGoods() {
        let ac = UIAlertController(title: "What to buy?", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak ac, weak self] _ in
            guard let goods = ac?.textFields?[0].text else { return }
            self?.add(goods)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func add(_ goods: String) {
        allGoods.insert(goods, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    //MARK: - clear
    @objc func clearList() {
        allGoods.removeAll()
        tableView.reloadData()
    }
    
    //MARK: - share
    @objc func shareList() {
        let listOfAllGoods = allGoods.joined(separator: "\n")
        let ac = UIActivityViewController(activityItems: [listOfAllGoods], applicationActivities: [])
        present(ac, animated: true)
    }
    
    //MARK: - tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGoods.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Goods", for: indexPath)
        cell.textLabel?.text = allGoods[indexPath.row]
        return cell
    }
}

