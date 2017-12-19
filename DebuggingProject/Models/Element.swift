//
//  Element.swift
//  MidtermElements-InstructorNotes
//
//  Created by C4Q  on 12/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct Element: Decodable {
    let number: Int
    let weight: Double
    let name: String
    let symbol: String
    let meltingPoint: Int?
    let boilingPoint: Int?
    let discoveryYearStr: String?
    let discoveryYearInt: Int?
    init(number: Int, weight: Double, name: String, symbol: String, meltingPoint: Int?, boilingPoint: Int?, discoveryYearStr: String?, discoveryYearInt: Int?) {
        self.number = number
        self.weight = weight
        self.name = name
        self.symbol = symbol
        self.meltingPoint = meltingPoint
        self.boilingPoint = boilingPoint
        self.discoveryYearStr = discoveryYearStr
        self.discoveryYearInt = discoveryYearInt
    }
    enum CodingKeys: String, CodingKey {
        case number, weight, name, symbol, melting_c, boiling_c, discoveryYear
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let number = try container.decode(Int.self, forKey: .number)
        let weight = try container.decode(Double.self, forKey: .weight)
        let name = try container.decode(String.self, forKey: .name)
        let symbol = try container.decode(String.self, forKey: .symbol)
        let meltingPoint = try? container.decode(Int.self, forKey: .melting_c)
        let boilingPoint = try? container.decode(Int.self, forKey: .boiling_c)
        let discoveryYearStr: String? = try? container.decode(String.self, forKey: .discoveryYear)
        let discoveryYearInt = try? container.decode(Int.self, forKey: .discoveryYear)
        self.init(number: number, weight: weight, name: name, symbol: symbol, meltingPoint: meltingPoint, boilingPoint: boilingPoint, discoveryYearStr: discoveryYearStr, discoveryYearInt: discoveryYearInt)
    }

}
