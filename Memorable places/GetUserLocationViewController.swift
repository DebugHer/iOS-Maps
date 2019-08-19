

import UIKit
import MapKit
import CoreLocation

class GetUserLocationViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

    var locationManager = CLLocationManager()

    
    @IBOutlet weak var currentLocMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        //preferred
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //we will only be using this when the app is running
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation : CLLocation = locations[0]
        print(userLocation)
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        currentLocMap.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
        print("Executed this method!")
    }

}
