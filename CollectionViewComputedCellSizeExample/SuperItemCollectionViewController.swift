//
//  SuperItemCollectionViewController.swift
//  CollectionViewComputedCellSizeExample
//
//  Created by Ignacio Varela on 9/4/16.
//  Copyright © 2016 Ignacio Varela. All rights reserved.
//

import UIKit

class SuperItemCollectionViewController: UICollectionViewController {
    
    private var templateCell: SuperItemCell?
    
    private struct Constants {
        static let cellReuseIdentifier: String = "SuperItemCell"
        static let numberOfColumnsPortrait: CGFloat = 1
        static let numberOfColumnsLandscape: CGFloat = 2
    }
    
    var items: [SuperItem]? {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerNib(UINib(nibName: SuperItemCell.nibName, bundle: NSBundle(forClass: SuperItemCell.self)), forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        
        templateCell = NSBundle(forClass: SuperItemCell.self).loadNibNamed(SuperItemCell.nibName, owner: nil, options: nil).first as? SuperItemCell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items?.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellReuseIdentifier, forIndexPath: indexPath)
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(SuperDetailViewController(), animated: true)
    }
}
