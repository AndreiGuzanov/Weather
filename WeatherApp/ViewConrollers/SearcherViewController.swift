//
//  SearcherViewController.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 16.12.2021.
//

import UIKit
import CoreLocation


class SearcherViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var searcher: UISearchBar!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        searcher.delegate = self
    }
        
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let city = searchBar.text ?? ""
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            controller.currentCity = city
            controller.searchCity(searchSity: city)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func goBackToMainScreen(_ sender: Any) {

    }
}
