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
    
    var player: AVPlayer?
    
    // MARK: Outlets
    
    @IBOutlet weak var moviesLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ClientClass.sharedInstance().taskForGetMiniGalleryData(method: "", parameters: ["" : ""]) { (media, error) in
            
            if error != nil {
                print("Shit done fucked up")
            }
            
            if let media = media {
                print("This is the goddamn media: \(media)")
            }
        }
        
        //initializeVideoPlayerWithVideo()
    }    
    
//    func initializeVideoPlayerWithVideo() {
//
//        print("Nah tho?")
//
//        // get the path string for the video from assets
//        //let videoString:String? = Bundle.main.path(forResource: "https://media.giphy.com/media/l0ExncehJzexFpRHq/giphy", ofType: "mp4")
//        //guard let unwrappedVideoPath = videoString else {return}
//
//        print("Yes, tho")
//
//        // convert the path string to a url
//        let videoUrl = URL(fileURLWithPath: "https://media.giphy.com/media/l0ExncehJzexFpRHq/giphy")
//
//        // initialize the video player with the url
//        self.player = AVPlayer(url: videoUrl)
//
//        // create a video layer for the player
//        let layer: AVPlayerLayer = AVPlayerLayer(player: player)
//
//        // make the layer the same size as the container view
//        layer.frame = swipeView.bounds
//
//        // make the video fill the layer as much as possible while keeping its aspect size
//        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//
//        // add the layer to the container view
//        swipeView.layer.addSublayer(layer)
//
//        player?.play()
//
//        print("This shit happened")
//    }
    
}

