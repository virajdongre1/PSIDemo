//
//  ViewController.swift
//  PSIDemo
//
//  Created by Viraj Dongre on 02/12/19.
//  Copyright © 2019 Viraj Dongre. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private var root: Root?
    
    // MARK:- IBOutlets
    @IBOutlet weak private var mapView: MKMapView!
    
    private var annotations = [MKAnnotation]()
        
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.getPSIData()
        
    }
    
    // MARK:- Private Function
    private func getPSIData() {
        
        PSIServices.fetchPSIData { root in
            guard let root = root else { return }
            self.root = root
            self.addMarkersOnMap()
        }
    }
    
    private func addMarkersOnMap() {
        
        guard let pinPoints = self.root?.region_metadata else {
            return
        }
        
        pinPoints.forEach { point in
            let location = CLLocationCoordinate2DMake(point.label_location.latitude,
                                                      point.label_location.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = point.name
            self.annotations.append(annotation)
        }
        
        func adjustMapLayout() {
            DispatchQueue.main.async {
                self.mapView.addAnnotations(self.annotations)
                let visibleRegion = MKCoordinateRegion(center: self.annotations.last?.coordinate ?? self.mapView.centerCoordinate,
                                                       latitudinalMeters: 40000.0,
                                                       longitudinalMeters: 40000.0)
                self.mapView.setRegion(visibleRegion, animated: true)
            }
        }
        
        adjustMapLayout()
    }
    
    private func showPSIDetails(with psiValue: String) {
        
        let alertController = UIAlertController(title: "Details", message: psiValue, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Ok", style: .default) { _ in }
        alertController.addAction(action1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension ViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
        } else {
            pinView!.annotation = annotation
        }
        
        let pinCalloutView: UILabel = { pinCalloutView in
            pinCalloutView.translatesAutoresizingMaskIntoConstraints = false
            pinCalloutView.font = UIFont.systemFont(ofSize: 12.0)
            pinCalloutView.numberOfLines = 0
            pinCalloutView.text = annotation.subtitle!
            return pinCalloutView
        }(UILabel())
        
        pinView!.detailCalloutAccessoryView = pinCalloutView
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        guard let selectedAnnotationView = view as? MKPinAnnotationView,
            let selectedAnnotation = selectedAnnotationView.annotation,
            let annotationTitle = selectedAnnotation.title as? String else { return }
        
        var psiList = [String: Double]()
        
        guard let items = self.root?.items else {
            print("Failure")
            return
        }
        
        items.forEach { item in
            let readingsMirror = Mirror(reflecting: item.readings)
            
            readingsMirror.children.forEach { readingsChild in
                
                if let readingsChildLabel = readingsChild.label,
                    let readingsChildValue = readingsChild.value as? SubIndex {
                    
                    let subIndexMirror = Mirror(reflecting: readingsChildValue)
                    
                    let indexValue = subIndexMirror.children.filter {
                        $0.label == annotationTitle
                    }
                    if let value = indexValue.first?.value as? Double {
                        psiList[readingsChildLabel] = value
                    }
                }
            }
        }
        
        let psiKeys = psiList.keys
        var finalString = ""
        
        psiKeys.forEach { key in
            guard let psiValue = psiList[key] else {
                return
            }
            finalString = finalString + "\n" + "\(key): \(psiValue)"
        }
        
        self.showPSIDetails(with: finalString)
        
    }
    
}
    



