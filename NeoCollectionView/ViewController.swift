//
//  ViewController.swift
//  NeoCollectionView
//
//  Created by Neo Shen on 16/05/2017.
//  Copyright © 2017 Neo Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = NeoCollectionViewModel()
    var handler: NeoCollectionViewDataHandler!
    
    var collectinoView: NeoCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        handler = NeoCollectionViewDataHandler(viewModel: viewModel)
        collectinoView = NeoCollectionView(dataHandler: handler)
        
        view.addSubview(collectinoView)
        collectinoView.translatesAutoresizingMaskIntoConstraints = false
        collectinoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectinoView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectinoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectinoView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

