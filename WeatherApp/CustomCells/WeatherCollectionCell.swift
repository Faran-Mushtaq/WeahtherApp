//
//  WeatherCollectionCell.swift
//  WeatherApp
//
//  Created by Faran on 3/24/19.
//  Copyright © 2019 Faran. All rights reserved.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var lblDay : UILabel!
    @IBOutlet weak var lblMax : UILabel!
    @IBOutlet weak var lblMin : UILabel!
    @IBOutlet weak var imgWeather : UIImageView!
    @IBOutlet weak var lblTime : UILabel!
    
    
    func setData(data : WeatherList){
        
        self.lblDay.text = getDayFromTimeStamp(TimeStamp: Double((data.dt)!))
        let stringURL = "http://openweathermap.org/img/w/" + (data.weather?.first?.icon)! + ".png"
        self.imgWeather.setImageFromUrl(urlStr: stringURL)
        self.lblMax.text = String(format: "%.0f", (data.main?.tempMax)! - 273.15) + "º"
        self.lblMin.text = String(format: "%.0f", (data.main?.tempMin)! - 273.15) + "º"
        self.lblTime.text = dateFormatter(date : data.dt_txt ?? "" , inFormat: "yyyy-MM-dd HH:mm:ss", outFormat: "hh:mm:a")
    }
    
    func getDayFromTimeStamp(TimeStamp : Double) -> String {
        
        let date = Date(timeIntervalSince1970: TimeStamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        let day = formatter.string(from: date)
        return day
    }
    
    func dateFormatter(date : String , inFormat : String , outFormat :String) -> String{
        
        let longDateFormatter = DateFormatter()
        longDateFormatter.dateFormat = inFormat
        let date = longDateFormatter.date(from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outFormat
        return dateFormatter.string(from: date!)
    }
}
