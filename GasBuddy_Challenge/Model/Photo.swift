//
//  Photo.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-05-31.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class Photo: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
