//
//  ViewController.swift
//  MiniGallery
//
//  Created by Tomas Sidenfaden on 6/4/18.
//  Copyright © 2018 Tomas Sidenfaden. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: Variables
    
    //var player: AVPlayer?
    var queuePlayer: AVQueuePlayer?
    var playerLooper: AVPlayerLooper?
    
    // MARK: Outlets
    
    @IBOutlet weak var moviesLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ClientClass.sharedInstance().taskForGetMiniGalleryData() { (media, error) in
            
            if error != nil {
                print("Error getting media")
            }
            
            if let media = media {
                Asset.sharedInstance = Asset.assetFromResults(media as! [[String : AnyObject]])
                print(Asset.sharedInstance[1].video)
                
                self.initializeVideoPlayerWithVideo()
            }
        }
        
        ClientClass.sharedInstance().getMiniGalleryResults { (assets, error) in
            
            if error != nil {
                print("Convenience error")
            }
            
            if let assets = assets {
                print("These are the convenience assets: \(assets)")
            }
        }
    }    
    
    func initializeVideoPlayerWithVideo() {
        
        // initialize queuePlayer
        queuePlayer = AVQueuePlayer()
        
        // initialize AVPlayerItem
        let playerItem = AVPlayerItem(asset: Asset.sharedInstance[0].video)
        
        // initialize the playerLooper with the player item and reference to queuePlayer
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)
        
        // create a video layer for the player
        let layer: AVPlayerLayer = AVPlayerLayer(player: queuePlayer)
        
        performUIUpdatesOnMain {
            
            // make the layer the same size as the container view
            layer.frame = CGRect(x: self.swipeView.frame.minX, y: self.swipeView.frame.minY + 72, width: self.swipeView.frame.width, height: self.swipeView.frame.height - 72)
            
            // make the video fill the layer as much as possible while keeping its aspect size
            layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            
            // add the layer to the container view
            self.swipeView.layer.addSublayer(layer)
        }
        queuePlayer?.play()
    }
}

