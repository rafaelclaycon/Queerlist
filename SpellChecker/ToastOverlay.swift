//
//  LoaderOverlay.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 02/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import UIKit

public class ToastOverlay {

    private var loaderOverlayView: UIView!

    class var shared: ToastOverlay {
        struct Static {
            static let instance: ToastOverlay = ToastOverlay()
        }
        return Static.instance
    }

    private func setUp() {
        loaderOverlayView = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 280))
        loaderOverlayView.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        loaderOverlayView.alpha = 1.00
        loaderOverlayView.layer.cornerRadius = 14
        
        let color = UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.00)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 140, height: 126))
        let star = UIImage(systemName: "star.fill")!
        let grayStar = star.withTintColor(color, renderingMode: .alwaysOriginal)
        imageView.image = grayStar
        loaderOverlayView.addSubview(imageView)
        imageView.center = CGPoint(x: loaderOverlayView.frame.width/2.0, y: loaderOverlayView.frame.height/2.0 - 30)
        
        let label: UILabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = "Added to Favorites"
        label.textColor = color
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        loaderOverlayView.addSubview(label)
        label.center = CGPoint(x: loaderOverlayView.frame.width/2.0, y: loaderOverlayView.frame.height - 50)
    }

    // MARK:- Public
    public func show() {
        if loaderOverlayView == nil {
            self.setUp()
        } else {
            //let indicator = loaderOverlayView.viewWithTag(1) as! UIActivityIndicatorView
            //indicator.startAnimating()
        }

        if let window = UIApplication.shared.delegate?.window {
            window!.addSubview(loaderOverlayView)
            loaderOverlayView.center = window!.center
        }
    }

    public func hide() {
        //let indicator = loaderOverlayView.viewWithTag(1) as! UIActivityIndicatorView
        //indicator.stopAnimating()

        loaderOverlayView.removeFromSuperview()
    }
}
