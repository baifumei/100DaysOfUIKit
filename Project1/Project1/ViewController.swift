//
//  ViewController.swift
//  Project1
//
//  Created by Екатерина К on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //to interact with the file system
        let fm = FileManager.default
        
        //a path to the resource directory of the main application bundle
        let path = Bundle.main.resourcePath!
        
        //an array of strings representing the names of files and folders located at the specified path
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
}

