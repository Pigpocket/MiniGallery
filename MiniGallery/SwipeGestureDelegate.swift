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
                nextTrack()
                
            case UISwipeGestureRecognizerDirection.right:
                previousTrack()
            default:
                break
            }
        }
    }
    
    func previousTrack() {
        
        if currentVideo != 0 {
            currentVideo -= 1
            movieNameLabel.text = Asset.movieNames[currentVideo]
            playTrack()
        }
    }
    
    func nextTrack() {
        
        if currentVideo != Asset.avPlayerItems.count - 1 {
            currentVideo += 1
            movieNameLabel.text = Asset.movieNames[currentVideo]
            playTrack()
        }
    }
    
    func playTrack() {
        
        if Asset.avPlayerItems.count > 0 {
            player?.replaceCurrentItem(with: Asset.avPlayerItems[currentVideo])
            player?.play()

        }
    }

    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: kCMTimeZero, completionHandler: nil)
            player?.play()
        }
    }

}
