//
//  MiniGalleryConvenience.swift
//  MiniGallery
//
//  Created by Tomas Sidenfaden on 6/6/18.
//  Copyright © 2018 Tomas Sidenfaden. All rights reserved.
//

import Foundation

extension ClientClass {
    
    func getMiniGalleryResults( completionHandlerForSearchResults: @escaping (_ assets: [Asset]?, _ errorString: String?) -> Void) {
        
        taskForGetMiniGalleryData { (assets, error) in
        
            if let error = error {
                completionHandlerForSearchResults(nil, error.localizedDescription)
            } else {
                if let assets = assets {
                    print("These are assets in convenience class: \(assets)")
                    } else {
                        completionHandlerForSearchResults(nil, "Unable to get array of locations")
                    }
                }
            }
        }
    }

