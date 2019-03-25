//
//	WeatherWind.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherWind : Codable {

	let deg : Float?
	let speed : Float?


	enum CodingKeys: String, CodingKey {
		case deg = "deg"
		case speed = "speed"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		deg = try values.decodeIfPresent(Float.self, forKey: .deg) ?? Float()
		speed = try values.decodeIfPresent(Float.self, forKey: .speed) ?? Float()
	}


}
