//
//  ViewController.swift
//  CollectionViewLab
//
//  Created by Phoenix McKnight on 9/26/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
  
    

    var country = [Country]() {
        didSet {
            collectionViewOutlet.reloadData()
        }
    }
    
    var searchString:String? = nil {
        didSet {
            collectionViewOutlet.reloadData()
        }
    }
    
    var searchResults:[Country] {
        guard let searchString = searchString else {
            return country
        }
        guard searchString != "" else {
            return country
        }
        return country
    }
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
   
    @IBOutlet weak var searchBarCountryOutlet: UISearchBar!
    
    
    private func loadData(country:String) {
        CountryAPIClient.manager.getCountries(name: country) {
            (results) in
            switch results {
            case .failure(let error):
                print(error)
            case .success(let countryData):
                self.country = countryData
                
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchText
        loadData(country: searchText)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let countryUnwrapped = country[indexPath.item]
        let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! CollectionViewCell
        
        cell.capitalLabel.text = countryUnwrapped.capital
        cell.countryName.text = countryUnwrapped.name
        cell.populationLabe.text = countryUnwrapped.population.description
        
         let countryImageURL = CountryAPIClient.manager.getCountryFlagURL(name: countryUnwrapped.alpha2Code)
        ImageHelper.shared.getImage(urlStr: countryImageURL) {
            (results) in
            DispatchQueue.main.async {
                switch results {
                case .failure(let error):
                    print(error)
                case .success(let validFlagImage):
                    cell.imageViewOutlet.image = validFlagImage
                }
            }
        }
        return cell
    }
    
    func setUp() {
        searchBarCountryOutlet.delegate = self
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }


}

