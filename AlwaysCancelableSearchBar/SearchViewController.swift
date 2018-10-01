//
//  SearchViewController.swift
//  AlwaysCancelableSearchBar
//
//  Created by SatoKei on 2018/10/01.
//  Copyright © 2018 kei.sato. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchBar = AlwaysCancelableSearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        searchBar.cancelButtonColor = UIColor.blue
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        navigationItem.titleView = searchBar
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.resignFirstResponder()
    }

}

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
}
