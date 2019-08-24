//
//  SearchBarfind.swift
//  ios-UISearch
//
//  Created by eduardo mancilla on 8/24/19.
//  Copyright © 2019 black. All rights reserved.
//

import UIKit

typealias ClosureSeachBar = (String) -> Void

class SearchBarfind: NSObject {
    fileprivate var isFind: Bool = false
    fileprivate lazy var searchBar = UISearchBar(frame: CGRect.zero)
    fileprivate weak var navigationItem: UINavigationItem?
    fileprivate var closure: ClosureSeachBar
    var titlefind = "Find"
    var titleCancel = "Cancel"
    var placeHolder = "Find"
    
    init(navigationItem: UINavigationItem, _ onChange: @escaping ClosureSeachBar) {
        closure = onChange
        super.init()
        self.navigationItem = navigationItem
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        configMenuItemSearch(navigationItem: navigationItem, title: titlefind)
    }
    
    
    func configMenuItemSearch(navigationItem: UINavigationItem?, title: String) {
        navigationItem?.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(tabButtonFind))
    }
    
    @objc func tabButtonFind() {
        isFind.toggle()
        if isFind {
            showSeachBar()
        } else {
            hideSeachBar()
        }
    }
    
    func showSeachBar() {
        configMenuItemSearch(navigationItem: navigationItem, title: titleCancel)
        
        searchBar.placeholder = placeHolder
        navigationItem?.titleView = searchBar
        searchBar.becomeFirstResponder()
    }
    
    func hideSeachBar() {
        configMenuItemSearch(navigationItem: navigationItem, title: titlefind)
        navigationItem?.titleView = nil
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
}

extension SearchBarfind: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        closure(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
