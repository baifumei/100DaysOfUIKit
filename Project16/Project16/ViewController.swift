//
//  ViewController.swift
//  Project16
//
//  Created by Екатерина К on 2/7/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
//    var mapTypeChosen: MKMapType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(chooseMapType))
        
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            let markerAnnotation = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            markerAnnotation.markerTintColor = .blue
            
            annotationView = markerAnnotation
            annotationView?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func chooseMapType() {
        let ac = UIAlertController(title: "What view of the map do you prefer?", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "satellite", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "satellite Flyover", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .satelliteFlyover
        }))
        ac.addAction(UIAlertAction(title: "hybrid", style: .default, handler:{ [weak self] _ in
            self?.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "hybrid Flyover", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .hybridFlyover
        }))
        ac.addAction(UIAlertAction(title: "muted Standard", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .mutedStandard
        }))
        ac.addAction(UIAlertAction(title: "standard", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .standard
        }))
        present(ac, animated: true)
    }
}

