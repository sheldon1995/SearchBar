//
//  ViewController.swift
//  SearchBar
//
//  Created by Sheldon on 12/30/19.
//  Copyright © 2019 wentao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    @objc func handleShowSearchBar(){
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Search Bar"
        searchBar.sizeToFit()
        searchBar.placeholder = "Please type in your info"
        searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        showSearchBarButton(shouldShow: true)
    }
    
    func showSearchBarButton(shouldShow:Bool){
        if(shouldShow){
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        }
        else{
            // When hit the button, the magnifying-glass icon hidden
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow:Bool){
        showSearchBarButton(shouldShow: !shouldShow)
         // Add cancel button
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar :nil
    }
    
}
extension ViewController : UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Did begin editing")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Did end editing")
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text is \(searchText)")
    }
}
