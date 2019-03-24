//
//	WeatherCloud.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherCloud : Codable {

	let all : Int?


	enum CodingKeys: String, CodingKey {
		case all = "all"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		all = try values.decodeIfPresent(Int.self, forKey: .all) ?? Int()
	}


}