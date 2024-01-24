//
//  ViewController.swift
//  Project1
//
//  Created by Екатерина К on 22.11.2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var viewCount = [String: Int]()
    
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
        
        let defaults = UserDefaults.standard
        
        if let savedData = defaults.object(forKey: "viewCount") as? Data {
            let jsonDecoder = JSONDecoder()

            do {
                viewCount = try jsonDecoder.decode([String: Int].self, from: savedData)
            }
            catch {
                print("Failed to load")
            }
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let picture = pictures[indexPath.row]
        cell.textLabel?.text = picture
        cell.detailTextLabel?.text = "view count:" + String(viewCount[picture] ?? 0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            let picture = pictures[indexPath.row]
            viewCount[picture] = (viewCount[picture] ?? 0) + 1
            save()
            tableView.reloadData()
            vc.selectedImage = picture
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
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(viewCount) {
            UserDefaults.standard.set(savedData, forKey: "viewCount")
        } else {
            print("Failed to save how many times each picture was opened")
        }
    }
}

