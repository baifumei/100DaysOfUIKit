//
//  Capital.swift
//  Project16
//
//  Created by Екатерина К on 2/8/24.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.coordinate = coordinate
        self.title = title
        self.info = info
    }
}
