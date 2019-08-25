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
    var titlefind = "🔎"
    var titleCancel = "❌"
    var placeHolder = "Buscar"
    
    init(navigationItem: UINavigationItem, menuItems: [UIBarButtonItem] = [UIBarButtonItem](), _ onChange: @escaping ClosureSeachBar) {
        closure = onChange
        super.init()
        self.navigationItem = navigationItem
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        configMenuItemSearch(navigationItem: navigationItem, title: titlefind)
        for item in menuItems {
            navigationItem.rightBarButtonItems!.append(item)
        }
    }
    
    private func configMenuItemSearch(navigationItem: UINavigationItem?, title: String) {
        navigationItem?.rightBarButtonItem = SearchBarfind.createUIBarButtonItem(self, title, action: #selector(tabButtonFind))
    }
    
    @objc func tabButtonFind() {
        isFind.toggle()
        if isFind {
            showSeachBar()
        } else {
            hideSeachBar()
        }
    }
    
    private func showSeachBar() {
        configMenuItemSearch(navigationItem: navigationItem, title: titleCancel)
        
        searchBar.placeholder = placeHolder
        navigationItem?.titleView = searchBar
        searchBar.becomeFirstResponder()
    }
    
    private func hideSeachBar() {
        configMenuItemSearch(navigationItem: navigationItem, title: titlefind)
        navigationItem?.titleView = nil
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
    
    class func createUIBarButtonItem(_ target: Any, _ image: UIImage?, action: Selector?, width: Int = 15, height: Int = 15) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        if let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        button.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return UIBarButtonItem(customView: button)
    }
    
    class func createUIBarButtonItem(_ target: Any, _ title: String, action: Selector?) -> UIBarButtonItem {
        return UIBarButtonItem(title: title, style: .plain, target: target, action: action)
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
