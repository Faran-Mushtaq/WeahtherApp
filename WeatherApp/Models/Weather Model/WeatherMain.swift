//
//	WeatherMain.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherMain : Codable {

	let grndLevel : Float?
	let humidity : Int?
	let pressure : Float?
	let seaLevel : Float?
	let temp : Float?
	let tempKf : Float?
	let tempMax : Float?
	let tempMin : Float?


	enum CodingKeys: String, CodingKey {
		case grndLevel = "grnd_level"
		case humidity = "humidity"
		case pressure = "pressure"
		case seaLevel = "sea_level"
		case temp = "temp"
		case tempKf = "temp_kf"
		case tempMax = "temp_max"
		case tempMin = "temp_min"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		grndLevel = try values.decodeIfPresent(Float.self, forKey: .grndLevel) ?? Float()
		humidity = try values.decodeIfPresent(Int.self, forKey: .humidity) ?? Int()
		pressure = try values.decodeIfPresent(Float.self, forKey: .pressure) ?? Float()
		seaLevel = try values.decodeIfPresent(Float.self, forKey: .seaLevel) ?? Float()
		temp = try values.decodeIfPresent(Float.self, forKey: .temp) ?? Float()
		tempKf = try values.decodeIfPresent(Float.self, forKey: .tempKf) ?? Float()
		tempMax = try values.decodeIfPresent(Float.self, forKey: .tempMax) ?? Float()
		tempMin = try values.decodeIfPresent(Float.self, forKey: .tempMin) ?? Float()
	}


}
