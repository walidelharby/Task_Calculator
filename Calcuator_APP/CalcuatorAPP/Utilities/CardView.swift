//
//  CardView.swift
//  Brightskies_Test
//
//  Created by Walid Elharby on 3/28/21.
//
//

import UIKit

class CardView: UIView {
    
    @IBInspectable var cornerrRadius: CGFloat = 6
    @IBInspectable var shadowOffSetWidth: CGFloat = 2
    @IBInspectable var shadowOffSetHeight: CGFloat = 3
    @IBInspectable var shadowOpacity: CGFloat = 0.5
    @IBInspectable var shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
    @IBInspectable var BorderWidth: CGFloat = 0
    @IBInspectable var BorderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    override func layoutSubviews() {
        layer.cornerRadius = cornerrRadius
        layer.shadowColor = shadowColor.cgColor
        layer.borderWidth = BorderWidth
        layer.borderColor = BorderColor.cgColor

        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerrRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
    }
    
}

