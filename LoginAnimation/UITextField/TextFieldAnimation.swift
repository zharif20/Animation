//
//  TextFieldAnimation.swift
//  LoginAnimation
//
//  Created by Local on 09/09/2018.
//  Copyright © 2018 Local. All rights reserved.
//

import Foundation
import UIKit

class TextFieldAnimation: UITextField {
    
    func shakeTextField() {
        let animatePosition = CABasicAnimation(keyPath: "position")
        
        animatePosition.duration = 0.05
        animatePosition.repeatCount = 5
        animatePosition.autoreverses = true
        animatePosition.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
        animatePosition.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        
        self.layer.add(animatePosition, forKey: "position")
    }
    
    
}
