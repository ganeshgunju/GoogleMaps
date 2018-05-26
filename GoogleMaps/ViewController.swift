//
//  ViewController.swift
//  GoogleMaps
//
//  Created by GaneshKumar Gunju on 22/05/18.
//  Copyright © 2018 vaayooInc. All rights reserved.
//

import UIKit
import MapKit


class customPin:NSObject,MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
     init(pinTitle:String,pinSubTitle:String,location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}
class ViewController: UIViewController,MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let location = CLLocationCoordinate2D(latitude: 14.4125825, longitude: 78.2284758)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        let pin = customPin(pinTitle:"My Hometown  ",pinSubTitle:"Bakarapuram,pulivendula",location:location)
        self.mapView.addAnnotation(pin)
        self.mapView.delegate = self
        
        //MARK:- MapView delegate method
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
            if annotation is MKAnnotationView {
                return nil  
            }
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named:"pin")
            return annotationView
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

