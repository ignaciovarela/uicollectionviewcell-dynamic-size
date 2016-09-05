//
//  SuperItemGenerator.swift
//  CollectionViewComputedCellSizeExample
//
//  Created by Ignacio Varela on 9/4/16.
//  Copyright © 2016 Ignacio Varela. All rights reserved.
//

import Foundation

struct SuperItemGenerator {
    private static let phrase = "I first met Dean not long after my wife and I split up. I had just gotten over a serious illness that I won't bother to talk about, except that it had something to do with the miserably weary split-up and my feeling that everything was dead. With the coming of Dean Moriarty began the part of my life you could call my life on the road. Before that I'd often dreamed of going West to see the country, always vaguely planning and never taking off. Dean is the perfect guy for the road because he actually was born on the road, when his parents were passing through Salt Lake City in 1926, in a jalopy, on their way to Los Angeles. First reports of him came to me through Chad King, who'd shown me a few letters from him written in a New Mexico reform school."
    
    private static let words = phrase.componentsSeparatedByString(" ")
    private static let maxNumberOfItems = 50
    
    static func generate() -> [SuperItem] {
        
        var items = [SuperItem]()
        let numberOfItems = arc4random_uniform(UInt32(maxNumberOfItems)) + 1
        for _ in 1...numberOfItems {
            let numberOfWords = arc4random_uniform(UInt32(words.count)) + 1
            Logger.log("Creating item with \(numberOfWords) words.")
            
            var wordsArray = [String]()
            for _ in 1...numberOfWords {
                let wordIndex = Int(arc4random_uniform(UInt32(words.count)))
                wordsArray.append(words[wordIndex])
            }
            
            items.append(SuperItem(text: wordsArray.joinWithSeparator(" ")))
        }
        
        return items
    }
}
