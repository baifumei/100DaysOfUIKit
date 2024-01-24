//
//  ViewController.swift
//  Project12
//
//  Created by Екатерина К on 1/23/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard

        // Сохранение данных
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        
        defaults.set("George May Atwood", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")

        let dict = ["Name": "Paul", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDict")
        
        //Извлечение данных
        let SavedArray = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
        let SavedDict = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()

    }


}

