//
//  LoadOverlay.swift
//  PSIDemo
//
//  Created by Viraj Dongre on 03/12/19.
//  Copyright © 2019 Viraj Dongre. All rights reserved.
//

import Foundation
import UIKit

class LoadOverlay {
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    internal func showOverlay(view: UIView) {
        
        overlayView.frame = CGRectMake(0, 0, 80, 80)
        overlayView.center = view.center
        //overlayView.backgroundColor = UIColor(white: 0x444444, alpha: 0.7)
        overlayView.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.5)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRectMake(0, 0, 40, 40)
        activityIndicator.activityIndicatorViewStyle = .WhiteLarge
        activityIndicator.center = CGPointMake(overlayView.bounds.width / 2, overlayView.bounds.height / 2)
        
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
        
        activityIndicator.startAnimating()
    }
    
    internal func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
    
}
