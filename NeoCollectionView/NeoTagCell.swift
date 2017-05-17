//
//  NeoTagCell.swift
//  NeoCollectionView
//
//  Created by Neo Shen on 17/05/2017.
//  Copyright © 2017 Neo Shen. All rights reserved.
//

import UIKit

class NeoTagCell: UICollectionViewCell {
    
    let title = UILabel()
    var imgView: UIImageView?
    
    var status =  TagStatusEnum.added {
        didSet {
            switch status {
            case .added:
                self.backgroundColor = UIColor.steel
                title.textColor = UIColor.white
                imgView?.image = #imageLiteral(resourceName: "checkMark")
                layer.borderWidth = 0
            default:
                self.backgroundColor = UIColor.white
                title.textColor = UIColor.nightBlue
                imgView?.image = #imageLiteral(resourceName: "add")
                layer.borderWidth = 1
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.paleGrey.cgColor
        layer.borderWidth = 1
        contentView.addSubview(title)
        imgView = status.image!
        contentView.addSubview(imgView!)
        
        title.textColor = UIColor.white
        title.textAlignment = .center
        title.font = UIFont.textStyleFont_12()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        imgView?.contentMode = .center
        imgView?.translatesAutoresizingMaskIntoConstraints = false
        imgView?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imgView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
