//
//  ViewController.swift
//  Project28
//
//  Created by Екатерина К on 4/16/24.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {
    
    var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet var secret: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(relockButton))
        navigationItem.rightBarButtonItem = nil
        
        title = "Nothing to see here!"
    
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notification.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notification.addObserver(self, selector: #selector(saveSecretMessage), name: UIApplication.willResignActiveNotification, object: nil)
        
        if KeychainWrapper.standard.hasValue(forKey: "password") == false {
            let ac = UIAlertController(title: "Create a password", message: "This passward will be used for login", preferredStyle: .alert)
            ac.addTextField()
            ac.addAction(UIAlertAction(title: "Submit", style: .cancel) { _ in
                if let password = ac.textFields?.first?.text {
                    KeychainWrapper.standard.set(password, forKey: "password")
                }
            })
            present(ac, animated: true)
        }
    }

    @IBAction func authenticateTapped(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticateError in
                DispatchQueue.main.async {
                    if success {
                        self?.unlockSecretMessage()
                    } else {
                        let ac = UIAlertController(title: "Enter your password", message: nil, preferredStyle: .alert)
                        ac.addTextField()
                        ac.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                            if let enteredPassword = ac.textFields?.first?.text {
                                if let savedPassword = KeychainWrapper.standard.string(forKey: "password") {
                                    if enteredPassword == savedPassword {
                                        self?.unlockSecretMessage()
                                    }
                                }
                            }
                        })
                        self?.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biomentric authentication!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEnd = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEnd, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            secret.contentInset = .zero
        } else {
            secret.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        secret.scrollIndicatorInsets = secret.contentInset
        
        let selectedRange = secret.selectedRange
        secret.scrollRangeToVisible(selectedRange)
    }
    
    func unlockSecretMessage() {
        secret.isHidden = false
        navigationItem.rightBarButtonItem = rightBarButtonItem
        title = "Secret stuff!"
        
        secret.text = KeychainWrapper.standard.string(forKey: "SecretMessage") ?? ""
    }
    
    @objc func saveSecretMessage() {
        guard secret.isHidden == false else { return }
        
        KeychainWrapper.standard.set(secret.text, forKey: "SecretMessage")
        secret.resignFirstResponder()
        secret.isHidden = true
        title = "Nothing to see here!"
        navigationItem.rightBarButtonItem = nil
    }
    
    @objc func relockButton() {
        saveSecretMessage()
    }
}

