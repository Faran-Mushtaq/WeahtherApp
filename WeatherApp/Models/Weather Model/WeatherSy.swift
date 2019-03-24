//
//	WeatherSy.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherSy : Codable {

	let pod : String?


	enum CodingKeys: String, CodingKey {
		case pod = "pod"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pod = try values.decodeIfPresent(String.self, forKey: .pod) ?? String()
	}


}