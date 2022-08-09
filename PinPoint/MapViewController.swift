//
//  ViewController.swift
//  PinPoint
//
//  Created by Данила on 09.08.2022.
//

import UIKit
import MapKit
import CoreLocation

// 59.939106, 30.315863

class MapViewController: UIViewController {
    
    var viewModel: MapViewModelProtocol! {
        didSet {
            viewModelChanged(viewModel)
        }
    }
 
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let addAdressButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MapViewModel()
        
        setConstreints()
        createStartLocation()
    //    mapView.delegate = self
    }

    
    // MARK: = viewModelChanged
    func viewModelChanged(_ viewModel: MapViewModelProtocol) {
        
    }
    
    func createStartLocation() {
        
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 59.939106, longitude: 30.315863)
        mapView.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 3500, longitudinalMeters: 3500)
        mapView.setRegion(region, animated: true)
    }
}

// MARK: - Constreints
extension MapViewController {
    
    func setConstreints() {
        
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        mapView.addSubview(addAdressButton)
        NSLayoutConstraint.activate([
            addAdressButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -30),
            addAdressButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            addAdressButton.heightAnchor.constraint(equalToConstant: 50),
            addAdressButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}


