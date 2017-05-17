//
//  NeoCollectionViewFlowLayout.swift
//  NeoCollectionView
//
//  Created by Neo Shen on 17/05/2017.
//  Copyright © 2017 Neo Shen. All rights reserved.
//

import UIKit

class NeoCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var itemAttributes: [UICollectionViewLayoutAttributes] = []
//    var supplementAttribtes: [UICollectionViewLayoutAttributes] = []
    let itemSpacing: CGFloat = 12
    let  lineSpacing: CGFloat = 7
    var viewModel: NeoCollectionViewModel!
    
    override init() {
        super.init()
        
        sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        minimumLineSpacing = 15.0
        minimumInteritemSpacing = 15.0
//        headerReferenceSize = CGSize(width: 375, height: 20)
//        footerReferenceSize = CGSize(width: 375, height: 20)
        scrollDirection = .vertical
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    convenience init(viewModel: NeoCollectionViewModel) {
        self.init()
        
        self.viewModel = viewModel
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        print(#function)
        let itemAttr = itemAttributes.filter {
            return $0.frame.intersects(rect)
        }
        
//        let supplementAttr = supplementAttribtes.filter {
//            return $0.frame.intersects(rect)
//        }
        
        return itemAttr// + supplementAttr
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        print(#function)
        let attributes = super.layoutAttributesForItem(at: indexPath)
        
        if let preAttr = layoutAttributesForItem(at: IndexPath(row: indexPath.row  - 1, section: indexPath.section)) {
            attributes?.frame.origin.x = preAttr.frame.origin.x + preAttr.frame.size.width
        }
        return attributes
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        print(#function)
        let attr = super.layoutAttributesForDecorationView(ofKind: elementKind, at: indexPath)
        return attr
    }
    
    override func prepare() {
        guard itemAttributes.isEmpty, let collectionView = collectionView else {
            return
        }
        for section in 0..<collectionView.numberOfSections {
//            let headerAttr = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, with: IndexPath(item: 0, section: section))
//            headerAttr.frame = CGRect(x: 0, y: 0, width: 375, height: 20)
//            supplementAttribtes.append(headerAttr)
            let itemCount = collectionView.numberOfItems(inSection: section)
            
            for item in 0..<itemCount {
                let indexPath = IndexPath(row: item, section: section)
                let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                
                let str = NSAttributedString(string: viewModel.tags[indexPath.row].name, attributes: [NSFontAttributeName: UIFont.textStyleFont_12()])
                var size = str.size()
                size.width += 30
                size.height += 7
                attr.frame.size = size
                
                if item > 0 {
                    let preAttr = itemAttributes[item - 1]
                    if preAttr.frame.origin.x + preAttr.frame.size.width + itemSpacing + attr.frame.width > collectionView.frame.width {
                        attr.frame = CGRect(x: 0, y: attr.frame.origin.y + attr.frame.size.height + lineSpacing, width: attr.frame.size.width, height: attr.frame.size.height)
                        
                    } else {
                        attr.frame = CGRect(x: preAttr.frame.origin.x + preAttr.frame.size.width + itemSpacing, y: preAttr.frame.origin.y, width: attr.frame.size.width, height: attr.frame.size.height)
                    }
                }
                
                itemAttributes.append(attr)
            }
            
        }
        
    }
}
