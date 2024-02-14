//
//  ViewController.swift
//  Project18
//
//  Created by Екатерина К on 2/14/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print()
        print("I'm inside the viewDidLoad() method!")
        print(1, 2, 3, 4, 5, terminator: "")
        print(1, 2, 3, 4, 5, separator: "-")
        
        //assert()
        //assert(1 == 1, "Maths failure!")
        //assert(1 == 2, "Maths failure!")
        //assert(myReallySlowMethod() == true, "The slow method returned false, which is a bad thing!")
        
        for i in 0...100 {
            print(i)
        }
    }
}

