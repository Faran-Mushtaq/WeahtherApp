//
//	WeatherCoord.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherCoord : Codable {

	let lat : Float?
	let lon : Float?


	enum CodingKeys: String, CodingKey {
		case lat = "lat"
		case lon = "lon"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lat = try values.decodeIfPresent(Float.self, forKey: .lat) ?? Float()
		lon = try values.decodeIfPresent(Float.self, forKey: .lon) ?? Float()
	}


}