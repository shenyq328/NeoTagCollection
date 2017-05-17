//
//  Tag.swift
//  NeoCollectionView
//
//  Created by Neo Shen on 17/05/2017.
//  Copyright © 2017 Neo Shen. All rights reserved.
//

import UIKit

enum TagStatusEnum {
    case added
    case notAdded
    
    var image: UIImageView? {
        switch self {
        case .added:
            return UIImageView(image: #imageLiteral(resourceName: "checkMark"))
        default:
            return UIImageView(image: #imageLiteral(resourceName: "add"))
        }
    }
    
}

struct Tag {
    let name: String
    var status: TagStatusEnum
}
