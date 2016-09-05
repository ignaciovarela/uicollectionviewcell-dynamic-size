//
//  HomeViewController.swift
//  CollectionViewComputedCellSizeExample
//
//  Created by Ignacio Varela on 9/4/16.
//  Copyright © 2016 Ignacio Varela. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let items = SuperItemGenerator.generate()
    private var superItemCollectionViewController: SuperItemCollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "# of items: \(items.count)"
        self.superItemCollectionViewController?.items = items
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let collectionViewController = segue.destinationViewController as? SuperItemCollectionViewController {
            self.superItemCollectionViewController = collectionViewController
        }
    }

}
