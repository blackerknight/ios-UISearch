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
        title = "titulo de prueba 1234567890"
        let menuItems = [
            SearchBarfind.createUIBarButtonItem(self, "⚙️", action: #selector(tapButtonMenu)),
            SearchBarfind.createUIBarButtonItem(self, "⚙️", action: #selector(tapButtonMenu)),
            SearchBarfind.createUIBarButtonItem(self, "⚙️", action: #selector(tapButtonMenu)),
            SearchBarfind.createUIBarButtonItem(self, "⚙️", action: #selector(tapButtonMenu))
        ]
        searchBar = SearchBarfind(navigationItem: navigationItem, menuItems: menuItems) { (text) in
            print("se va a filtrar por el texto: \(text)")
        }
    }
    
    @objc func tapButtonMenu() {
        print("Click en el boton del menu")
    }
}
