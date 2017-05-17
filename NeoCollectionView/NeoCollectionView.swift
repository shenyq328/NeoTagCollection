//
//  NeoCollectionView.swift
//  NeoCollectionView
//
//  Created by Neo Shen on 16/05/2017.
//  Copyright © 2017 Neo Shen. All rights reserved.
//

import UIKit

class NeoCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    convenience init(frame: CGRect, dataHandler: NeoCollectionViewDataHandler) {
        let layout = NeoCollectionViewFlowLayout(viewModel: dataHandler.viewModel)
        
        self.init(frame: frame, collectionViewLayout: layout, dataHandler: dataHandler)
        
        register(NeoTagCell.self, forCellWithReuseIdentifier: "tagCell")
//        register(NeoCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
//        register(NeoCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
    }
    
    convenience init(dataHandler: NeoCollectionViewDataHandler) {
        self.init(frame: .zero, dataHandler: dataHandler)
    }
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, dataHandler: NeoCollectionViewDataHandler) {
        super.init(frame: frame, collectionViewLayout: layout)
        dataSource = dataHandler
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NeoCollectionViewDataHandler: NSObject, UICollectionViewDataSource {
    var viewModel: NeoCollectionViewModel
    
    init(viewModel: NeoCollectionViewModel) {
        self.viewModel = viewModel
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! NeoTagCell
        cell.title.text = viewModel.tags[indexPath.row].name
        cell.status = viewModel.tags[indexPath.row].status
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        var name: String
//        switch kind {
//        case UICollectionElementKindSectionHeader:
//            name = "header"
//        default:
//            name = "footer"
//        }
//        
//        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind
//            , withReuseIdentifier: name, for: indexPath)
//        
//        return view
//    }

}


//
//class NeoCollectionHeaderView: UICollectionReusableView {
//    var title: String?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .blue
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//class NeoCollectionFooterView: UICollectionReusableView {
//    var title: String?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .orange
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}


