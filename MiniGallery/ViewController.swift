//
//  ViewController.swift
//  MiniGallery
//
//  Created by Tomas Sidenfaden on 6/4/18.
//  Copyright © 2018 Tomas Sidenfaden. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: Variables
    
    var player: AVPlayer?
    var playerLooper: AVPlayerLooper?
    var currentVideo = 0
    
    // MARK: Outlets
    
    @IBOutlet weak var moviesLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGestureRecognizers()
        movieNameLabel.text = Asset.movieNames[currentVideo]
        
        ClientClass.sharedInstance().taskForGetMiniGalleryData() { (media, error) in
            
            if error != nil {
                print("Error getting media")
            }
            
            if let media = media {
                Asset.sharedInstance = Asset.assetFromResults(media as! [[String : AnyObject]])
                for asset in Asset.sharedInstance {
                    let avPlayerItem = AVPlayerItem(asset: asset.video)
                    Asset.avPlayerItems.append(avPlayerItem)
                }
                
                self.initializeVideoPlayerWithVideo()
            }
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: Notification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: player?.currentItem)
        
    }    
    
    func initializeVideoPlayerWithVideo() {
        
        // initialize AVPlayer
        player = AVPlayer()
        
        // initialize AVPlayerItem
        let playerItem = AVPlayerItem(asset: Asset.sharedInstance[currentVideo].video)
        
        // load AVPlayer with AVPlayerItem
        player?.replaceCurrentItem(with: playerItem)
        
        // create a video layer for the player
        let layer: AVPlayerLayer = AVPlayerLayer(player: player)
        
        performUIUpdatesOnMain {
            
            // make the layer the same size as the container view
            layer.frame = CGRect(x: self.swipeView.frame.minX, y: self.swipeView.frame.minY + 72, width: self.swipeView.frame.width, height: self.swipeView.frame.height - 72)
            
            // make the video fill the layer as much as possible while keeping its aspect size
            layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            
            // add the layer to the container view
            self.swipeView.layer.addSublayer(layer)
        }
        player?.play()
        
    }
}

