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
        
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellReuseIdentifier, forIndexPath: indexPath) as? SuperItemCell,
            item = items?[indexPath.item] else {
            return UICollectionViewCell()
        }
        cell.configure(item.text)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(SuperDetailViewController(), animated: true)
    }
    
    // this is the key, it allows to change the layout when the device rotates.
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        coordinator.animateAlongsideTransition({ (context) in
            self.collectionView?.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}

extension SuperItemCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        guard let item = items?[indexPath.item],
            templateCell = templateCell,
            flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
            else { return CGSizeZero }
        
        templateCell.configure(item.text)
        
        let numberOfColumns = UIApplication.sharedApplication().statusBarOrientation.isPortrait ? Constants.numberOfColumnsPortrait : Constants.numberOfColumnsLandscape
        let sumOfSpaceBetweenCells = flowLayout.minimumInteritemSpacing * (numberOfColumns - 1)
        let availableWidth = collectionView.frame.size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right - sumOfSpaceBetweenCells
        let cellWidth = floor(availableWidth / numberOfColumns)
        
        return templateCell.computeCellSizeWith(width: cellWidth)
    }
}
