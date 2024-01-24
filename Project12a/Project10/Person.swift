//
//  Person.swift
//  Project10
//
//  Created by Екатерина К on 12.01.2024.
//

import UIKit

class Person: NSObject, NSCoding {
    //запись на диск
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(image, forKey: "image")
    }
    //чтение с диска
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        image = coder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.image = image
        self.name = name
    }
}
