//
//	WeatherCity.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherCity : Codable {

	let coord : WeatherCoord?
	let country : String?
	let id : Int?
	let name : String?


	enum CodingKeys: String, CodingKey {
		case coord
		case country = "country"
		case id = "id"
		case name = "name"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		coord = try values.decodeIfPresent(WeatherCoord.self, forKey: .coord)  //?? WeatherCoord()
		country = try values.decodeIfPresent(String.self, forKey: .country) ?? String()
		id = try values.decodeIfPresent(Int.self, forKey: .id) ?? Int()
		name = try values.decodeIfPresent(String.self, forKey: .name) ?? String()
	}


}