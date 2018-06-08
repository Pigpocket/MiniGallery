//
//  SwipeGestureDelegate.swift
//  MiniGallery
//
//  Created by Tomas Sidenfaden on 6/8/18.
//  Copyright © 2018 Tomas Sidenfaden. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension ViewController {
    
    func configureGestureRecognizers() {
    
        // declare gesture recognizers
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
    
        // configure gesture recognizers
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
    
        // assign gesture recognizer delegates
        swipeView.addGestureRecognizer(swipeRight)
        swipeView.addGestureRecognizer(swipeLeft)
    
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                print("Swipe left")
                
            case UISwipeGestureRecognizerDirection.right:
                print("Swipe right")
            default:
                break
            }
        }
    }
}
