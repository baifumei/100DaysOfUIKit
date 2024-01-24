//
//  ViewController.swift
//  Project1
//
//  Created by Екатерина К on 22.11.2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var numberOfPictures = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //a bar button item to the main view controller that recommends the app to other people (from challenge of project3)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendTheApp))
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        //from the challenge of the project9
        DispatchQueue.global(qos: .background).async { [self] in
            let items = try! fm.contentsOfDirectory(atPath: path)
            for item in items {
                if item.hasPrefix("nssl") {
                    self.pictures.append(item)
                }
            }
            self.pictures.sort()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.indexNumber = indexPath.row + 1
            vc.numberOfPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func recommendTheApp() {
            let message = "Посмотрите это приложение!"
            
            let vc = UIActivityViewController(activityItems: [message], applicationActivities: nil)
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
        }
}

