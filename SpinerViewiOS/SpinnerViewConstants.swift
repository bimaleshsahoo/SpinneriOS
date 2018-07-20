//
//  SpinnerViewConstants.swift
//  SpinerViewiOS
//
//  Created by SumitKumar on 20/07/18.
//  Copyright © 2018 SumitKumar. All rights reserved.
//

import Foundation
import UIKit


struct GLOBAL_CONSTANT {
    static let SCREEN_WIDTH : CGSize = UIScreen.main.bounds.size
    static let APP_DELEGATE = UIApplication.shared.delegate! as! AppDelegate
    
}

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}

public extension UITableView {
    
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 2
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
