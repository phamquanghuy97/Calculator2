//
//  UIView.swift
//  Calculator
//
//  Created by Phạm Huy on 5/24/19.
//  Copyright © 2019 Phạm Huy. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat{
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var boderColor: UIColor {
        get{
            return UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
