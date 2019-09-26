//
//  CountryAPIClient.swift
//  CollectionViewLab
//
//  Created by Phoenix McKnight on 9/26/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

class CountryAPIClient {
    
   static let manager = CountryAPIClient()
    
    func getCountryFlagURL(name:String) -> String {
      return "https://www.countryflags.io/\(name)/flat/64.png"
    }
    func getCountries(name:String,completionHandler:@escaping (Result<[Country],AppError>) -> Void) {
        
        let countryURL = "https://restcountries.eu/rest/v2/name/\(name)"
        
        guard let urlStr = URL(string: countryURL) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: urlStr, andMethod: .get) {
            (results) in
            switch results {
            case .failure(let error):
               completionHandler(.failure(error))
            case .success(let data):
                do { let countryData = try JSONDecoder().decode([Country].self, from: data)
completionHandler(.success(countryData))
                } catch {
                    completionHandler(.failure(.invalidJSONResponse))
                }
            
            }
        }
    }
}
