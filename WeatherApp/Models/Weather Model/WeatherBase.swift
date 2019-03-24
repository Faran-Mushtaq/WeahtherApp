//
//	WeatherBase.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherBase : Codable {

	let city : WeatherCity?
	let cnt : Int?
	let cod : String?
	let list : [WeatherList]?
	let message : Float?


	enum CodingKeys: String, CodingKey {
		case city = "city"
		case cnt = "cnt"
		case cod = "cod"
		case list = "list"
		case message = "message"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		city = try values.decodeIfPresent(WeatherCity.self, forKey: .city)  //?? WeatherCity()
		cnt = try values.decodeIfPresent(Int.self, forKey: .cnt) ?? Int()
		cod = try values.decodeIfPresent(String.self, forKey: .cod) ?? String()
		list = try values.decodeIfPresent([WeatherList].self, forKey: .list) ?? [WeatherList]()
		message = try values.decodeIfPresent(Float.self, forKey: .message) ?? Float()
	}


}
