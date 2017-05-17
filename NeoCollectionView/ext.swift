//
//  ext.swift
//  NeoCollectionView
//
//  Created by Neo Shen on 16/05/2017.
//  Copyright © 2017 Neo Shen. All rights reserved.
//

import UIKit

// Color palette
extension UIColor {
    class var steel: UIColor {
        return UIColor(red: 126.0 / 255.0, green: 138.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    }
    
    class var nightBlue: UIColor {
        return UIColor(red: 6.0 / 255.0, green: 29.0 / 255.0, blue: 65.0 / 255.0, alpha: 1.0)
    }
    
    class var paleGrey: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 246.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
}

// Text styles
extension UIFont {
    class func textStyleFont_12() -> UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightMedium)
    }
}
