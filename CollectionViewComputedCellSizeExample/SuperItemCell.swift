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
    private static var instanceCounter = 0
    private struct Constants {
        static let cornerRadius: CGFloat = 4.0
    }
    
    static let nibName = "SuperItemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = Constants.cornerRadius
        contentView.layer.masksToBounds = true
        SuperItemCell.instanceCounter += 1
        Logger.log("==== awakeFromNib: SuperItemCell \(SuperItemCell.instanceCounter)")
    }
    
    deinit {
        Logger.log("Deallocating SuperItemCell \(SuperItemCell.instanceCounter)")
        SuperItemCell.instanceCounter -= 1
    }
    
    func configure(text: String) {
        self.superTextLabel.text = text
        Logger.log("Configuring cell")
    }
    
    func computeCellSizeWith(width width: CGFloat) -> CGSize {
        // this constraint is needed to compute the cell size.
        mainContainerWidth.active = true
        mainContainerWidth.constant = width
        
        let computedSize = contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        Logger.log("Computed size: \(computedSize) - Cell width: \(width)")
        
        mainContainerWidth.active = false
        return computedSize
    }
}
