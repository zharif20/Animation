//
//  ViewController.swift
//  LoginAnimation
//
//  Created by Local on 09/09/2018.
//  Copyright © 2018 Local. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var texfieldShake: TextFieldAnimation!
    @IBOutlet weak var pressImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.texfieldShake.delegate = self
        
        self.pressImage.layer.cornerRadius = self.pressImage.frame.size.width/2
        self.pressImage.clipsToBounds = true
        self.pressImage.isUserInteractionEnabled = true
        
        let userTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        userTap.numberOfTapsRequired = 1
        self.pressImage.addGestureRecognizer(userTap)
        
        view.backgroundColor = .lightGray
    }
    
    @objc func handleTap() {
        let pulseAnimate = PulsingAnimation.init(numberOfPulses: 1, radius: 110, position: self.pressImage.center)
        pulseAnimate.animationDuration = 0.8
        pulseAnimate.backgroundColor = UIColor.black.cgColor
        self.view.layer.insertSublayer(pulseAnimate, below: self.pressImage.layer)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.texfieldShake.shakeTextField()
    }

}

