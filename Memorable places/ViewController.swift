import UIKit
import MapKit

class ViewController: UIViewController ,MKMapViewDelegate{

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //declaring the longitude and latitude
        let latitude: CLLocationDegrees = 6.6354
        let longitude: CLLocationDegrees = 3.3496
        
        //delta is the zoom level of the map
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        //span: Combination of the lat delta and lon delta to show the zoom level of the map
        let span: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        //CL: Core Location
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        //set annotation
        let annotation = MKPointAnnotation()
        annotation.title = "County Ogba"
        annotation.subtitle = "Hospital in Lagos"
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        
        //adding custom gesture recognizer
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
    }
    
    //selector function to add a new annotation
    @objc func longPress(gestureRecognizer: UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        annotation.subtitle = "Found a new Place"
        map.addAnnotation(annotation)
      
    }


}

