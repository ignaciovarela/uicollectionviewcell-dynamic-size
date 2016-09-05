//
//  SuperItemCell.swift
//  CollectionViewComputedCellSizeExample
//
//  Created by Ignacio Varela on 9/4/16.
//  Copyright © 2016 Ignacio Varela. All rights reserved.
//

import UIKit

class SuperItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var superTextLabel: UILabel!
    
    @IBOutlet private weak var mainContainerWidth: NSLayoutConstraint!
    
    static let nibName = "SuperItemCell"
}
