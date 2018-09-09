//
//  PulsingAnimation.swift
//  LoginAnimation
//
//  Created by Local on 09/09/2018.
//  Copyright © 2018 Local. All rights reserved.
//

import Foundation
import UIKit

class PulsingAnimation: CALayer {
    
    
    //Declare variable
    
    var animationGroup = CAAnimationGroup()
    
    var initialPulseScale: Float = 0
    var nextPulseAfter: TimeInterval = 0
    var animationDuration: TimeInterval = 1.5
    var radius: CGFloat = 200
    var numberOfPulses: Float = Float.infinity
    
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numberOfPulses: Float = Float.infinity, radius: CGFloat, position: CGPoint) {
        super.init()
        
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius * 2 , height: radius * 2 )
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupAnimationGroup()
            
            DispatchQueue.main.sync {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
    }
    
    func createScaleAnimation() -> CABasicAnimation {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        
        scaleAnimation.fromValue = NSNumber(value: self.initialPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = self.animationDuration
        return scaleAnimation
    }
    
    
    func createKeyFrameAnimation() -> CAKeyframeAnimation {
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.duration = self.animationDuration
        opacityAnimation.values = [0.4,0.8,0]
        opacityAnimation.keyTimes = [0,0.3,1]
        return opacityAnimation
    }
    
    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = self.animationDuration + self.nextPulseAfter
        self.animationGroup.repeatCount = self.numberOfPulses
        
        
        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        
        self.animationGroup.animations = [createScaleAnimation(),createKeyFrameAnimation()]
        
    }
    
    
}
