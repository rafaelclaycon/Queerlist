//
//  CustomButton.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 02/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }

    func setUpButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(red: 0.00, green: 0.45, blue: 0.98, alpha: 1.00)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        layer.cornerRadius = 14
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            let spacing: CGFloat = 14
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
        }
    }
}
