//
//  ViewController.swift
//  Project6b
//
//  Created by Екатерина К on 15.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let lable1 = UILabel()
        lable1.translatesAutoresizingMaskIntoConstraints = false
        lable1.backgroundColor = .red
        lable1.text = "THESE"
        lable1.sizeToFit()
        
        let lable2 = UILabel()
        lable2.translatesAutoresizingMaskIntoConstraints = false
        lable2.backgroundColor = .cyan
        lable2.text = "ARE"
        lable2.sizeToFit()
        
        let lable3 = UILabel()
        lable3.translatesAutoresizingMaskIntoConstraints = false
        lable3.backgroundColor = .yellow
        lable3.text = "SOME"
        lable3.sizeToFit()
        
        let lable4 = UILabel()
        lable4.translatesAutoresizingMaskIntoConstraints = false
        lable4.backgroundColor = .orange
        lable4.text = "AWESOME"
        lable4.sizeToFit()
        
        let lable5 = UILabel()
        lable5.translatesAutoresizingMaskIntoConstraints = false
        lable5.backgroundColor = .green
        lable5.text = "LABLE"
        lable5.sizeToFit()
        
        view.addSubview(lable1)
        view.addSubview(lable2)
        view.addSubview(lable3)
        view.addSubview(lable4)
        view.addSubview(lable5)
    }


}

