//
//  ViewController.swift
//  ios-UISearch
//
//  Created by eduardo mancilla on 8/24/19.
//  Copyright © 2019 black. All rights reserved.
//

import UIKit

class NavBarVC: UIViewController {
    fileprivate var searchBar: SearchBarfind!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        searchBar = SearchBarfind(navigationItem: navigationItem) { (text) in
            print("se va a filtrar por el texto: \(text)")
        }
    }
}
