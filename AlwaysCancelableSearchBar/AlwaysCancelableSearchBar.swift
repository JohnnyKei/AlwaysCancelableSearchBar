//
//  AlwaysCancelableSearchBar.swift
//  AlwaysCancelableSearchBar
//
//  Created by SatoKei on 2018/10/01.
//  Copyright © 2018 kei.sato. All rights reserved.
//

import UIKit

class AlwaysCancelableSearchBar: UISearchBar {

    var cancelButton: UIButton? {
        return super.value(forKey: "cancelButton") as? UIButton
    }
    var cancelButtonColor: UIColor? = UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
    var cancelTitle: String? = "Cancel"

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKayboardDidHideNotification(_:)), name: UIWindow.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShowNotification(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
    }
    override func setShowsCancelButton(_ showsCancelButton: Bool, animated: Bool) {
        super.setShowsCancelButton(showsCancelButton, animated: animated)
        cancelButton?.setTitle(cancelTitle, for: .normal)
        cancelButton?.setTitleColor(cancelButtonColor, for: .normal)
    }

    @objc private func handleKayboardDidHideNotification(_ notification: Notification) {
        cancelButton?.isEnabled = true
    }

    @objc private func handleKeyboardWillShowNotification(_ notification: Notification) {
        setShowsCancelButton(true, animated: true)
    }

}
