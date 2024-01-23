//
//  Person.swift
//  Project10
//
//  Created by Екатерина К on 12.01.2024.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.image = image
        self.name = name
    }
}
