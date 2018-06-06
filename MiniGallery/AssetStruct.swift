//
//  AssetStruct.swift
//  MiniGallery
//
//  Created by Tomas Sidenfaden on 6/5/18.
//  Copyright © 2018 Tomas Sidenfaden. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

struct Asset {
    
    static var sharedInstance: [Asset] = [Asset]()
    
    // MARK: Properties
    
    var id = 0
    var image: UIImage?
    var video: AVAsset
    
    // MARK: Initializer
    init?(dictionary: [String:AnyObject]) {
        
        // GUARD: Do all dictionaries have values?
        guard
            let id = dictionary[ClientClass.Constants.id] as? Int,
            //let imageUrl = dictionary[ClientClass.Constants.imageUrl] as? String,
            let videoUrl = dictionary[ClientClass.Constants.videoUrl] as? String
            
            // If not, return nil
            else { return nil }
        
        // Otherwise, initialize values
        self.id = id
        //self.image = name
        
        self.video = AVAsset(url: URL(string: videoUrl)!)
        
    }
    
    static func assetFromResults(_ results: [[String:AnyObject]]) -> [Asset] {
        
        return results.flatMap(Asset.init)
    }
    
}
