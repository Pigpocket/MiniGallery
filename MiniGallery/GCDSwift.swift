//
//  GCDSwift.swift
//  MiniGallery
//
//  Created by Tomas Sidenfaden on 6/6/18.
//  Copyright © 2018 Tomas Sidenfaden. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
