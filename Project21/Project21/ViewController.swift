//
//  ViewController.swift
//  Project21
//
//  Created by Екатерина К on 3/4/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))

    }

    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("yes")
            } else {
                print("no")
            }
        }
    }
    
    @objc func scheduleLocal() {
        
    }
}

