//
//  acoountBindButton.swift
//  Copad
//
//  Created by Cheng-Lung on 2017/2/9.
//  Copyright © 2017年 Cheng-Lung. All rights reserved.
//

import UIKit

@IBDesignable public class accountBindButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white
    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var cornerRadius : CGFloat = 0.0
    
    override public func draw(_ rect: CGRect) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }

}
