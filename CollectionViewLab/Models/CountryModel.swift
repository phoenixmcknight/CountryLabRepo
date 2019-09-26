//
//  CountryModel.swift
//  CollectionViewLab
//
//  Created by Phoenix McKnight on 9/26/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

struct Country: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region, subregion: String
    let population: Int
    let latlng: [Int]
    let demonym: String
    let area: Int?
    let gini: Double?
    let timezones, borders: [String]
    let nativeName, numericCode: String
    let currencies: [Currency]
    let flag: String
    let cioc: String

}

// MARK: - Currency
struct Currency: Codable {
    let code, name, symbol: String
}

