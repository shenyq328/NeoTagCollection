//
//  NeoCollectionViewModel.swift
//  NeoCollectionView
//
//  Created by Neo Shen on 17/05/2017.
//  Copyright © 2017 Neo Shen. All rights reserved.
//

import Foundation

struct NeoCollectionViewModel {
    //dummy data
    let tags: [Tag] = [
        Tag(name: "Automotive", status: .notAdded),
        Tag(name: "Euro Equities", status: .added),
        Tag(name: "Germany", status: .notAdded),
        Tag(name: "Climate Change", status: .notAdded),
        Tag(name: "Volkswagen", status: .notAdded)
    ]
}
