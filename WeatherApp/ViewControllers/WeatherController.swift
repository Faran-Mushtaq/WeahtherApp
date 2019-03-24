//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Faran on 3/24/19.
//  Copyright © 2019 Faran. All rights reserved.
//

import UIKit
import CoreLocation


protocol WeatherControllerDelegate {
    func getStatus(status : Bool)
}


class WeatherController: UIViewController {
    
    
    //OUTLETS
    @IBOutlet weak var lblLocation : UILabel!
    @IBOutlet weak var lblDay : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var lblTemp : UILabel!
    @IBOutlet weak var lblPercipitation : UILabel!
    @IBOutlet weak var lblHumidity : UILabel!
    @IBOutlet weak var lblWind : UILabel!
    @IBOutlet weak var imgWeather : UIImageView!
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    //VARIABLES
    var locationManager: CLLocationManager!
    var latitude : String = ""
    var longitude : String = ""
    var delegate : WeatherControllerDelegate!
    var isFirstTime = true
    var list : [WeatherList] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if (CLLocationManager.locationServicesEnabled()){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func getWeatherData() {
        
        self.view.endEditing(true)
        
        let params : [String : Any] = ["lat" : self.latitude,
                                       "lon" : self.longitude,
                                       "appid" : "f53fdb778c22043615bc3ec2b93f4ae0"]
        
        WeatherManager().getWeatherData(endPoint: "", param: params) { (response) in
            
            self.list = response.list!
            self.setData(data: response)
            self.collectionView.reloadData()
        }
    }
    
    func setData(data : WeatherBase) {
        
        self.lblLocation.text = data.city?.name ?? ""
        self.lblDay.text = getDayFromTimeStamp(TimeStamp: Double((data.list?.first?.dt)!))
        self.lblDesc.text = data.list?.first?.weather?.first?.descriptionField ?? ""
        let stringURL = "http://openweathermap.org/img/w/" + (data.list?.first?.weather?.first?.icon)! + ".png"
        self.imgWeather.setImageFromUrl(urlStr: stringURL)
        self.lblWind.text = String(data.list!.first!.wind!.speed!)
        self.lblHumidity.text = String(data.list!.first!.main!.humidity!)
        self.lblPercipitation.text = String(data.list!.first!.main!.pressure!)
        self.lblTemp.text = String(format: "%.0f", (data.list?.first?.main?.temp)! - 273.15)
    }
    
    func getDayFromTimeStamp(TimeStamp : Double) -> String {
        
        let date = Date(timeIntervalSince1970: TimeStamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let day = formatter.string(from: date)
        return day
    }
}


extension WeatherController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.list.count == 0 ? 0 : self.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionCell", for: indexPath) as! WeatherCollectionCell
        cell.setData(data: self.list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.width/5, height: self.collectionView.frame.height)
    }
}


extension WeatherController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        self.latitude = String(location.coordinate.latitude)
        self.longitude = String(location.coordinate.longitude)
        
        //CALL API DELEGATE
        if(isFirstTime){
            self.delegate = self
            self.delegate.getStatus(status: true)
        }
    }
}


extension WeatherController : WeatherControllerDelegate{
    
    func getStatus(status: Bool) {
        
        if(status){
            self.isFirstTime = false
            self.getWeatherData()
        }
    }
}
