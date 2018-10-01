//
//  ViewController.swift
//  AlwaysCancelableSearchBar
//
//  Created by SatoKei on 2018/10/01.
//  Copyright © 2018 kei.sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .roundedRect)
        button.setTitle("Show", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTouch(_:)), for: .touchUpInside)
        button.sizeToFit()
        button.center = view.center
        view.addSubview(button)
    }

    @objc private func handleButtonTouch(_ sender: UIButton) {
        let searchViewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        present(navigationController, animated: true, completion: nil)
    }


}

