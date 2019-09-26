//
//  Currency Model.swift
//  CollectionViewLab
//
//  Created by Phoenix McKnight on 9/26/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

struct CurrencyRates: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}
