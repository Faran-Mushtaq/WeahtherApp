//
//	WeatherList.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherList : Codable {

	let clouds : WeatherCloud?
	let dt : Int?
	let dt_txt : String?
	let main : WeatherMain?
	let sys : WeatherSy?
	let weather : [Weather]?
	let wind : WeatherWind?


	enum CodingKeys: String, CodingKey {
		case clouds = "clouds"
		case dt = "dt"
		case dt_txt = "dt_txt"
		case main = "main"
		case sys = "sys"
		case weather = "weather"
		case wind = "wind"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		clouds = try values.decodeIfPresent(WeatherCloud.self, forKey: .clouds)  //?? WeatherCloud()
		dt = try values.decodeIfPresent(Int.self, forKey: .dt) ?? Int()
		dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt) ?? String()
		main = try values.decodeIfPresent(WeatherMain.self, forKey: .main)  //?? WeatherMain()
		sys = try values.decodeIfPresent(WeatherSy.self, forKey: .sys)  //?? WeatherSy()
		weather = try values.decodeIfPresent([Weather].self, forKey: .weather) ?? [Weather]()
		wind = try values.decodeIfPresent(WeatherWind.self, forKey: .wind)  //?? WeatherWind()
	}


}
