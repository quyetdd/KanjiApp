//
//  CardsFinished.swift
//  KanjiApp
//
//  Created by Sky on 2014-08-14.
//  Copyright (c) 2014 Sky. All rights reserved.
//

import Foundation

class CardsFinished : CustomUIViewController {
    
    @IBAction func continueStudyingPressed(sender: AnyObject) {
        print("continueStudyingPressed")
        Globals.notificationTransitionToView.postNotification(.GameMode)
    }
    
    @IBAction func addNewCardsPressed(sender: AnyObject) {
        print("addNewCardsPressed")
        
        let myWords = managedObjectContext.fetchEntities(.Card, [(CardProperties.enabled, false), (CardProperties.suspended, false)], CardProperties.interval, sortAscending: true)
        
        if myWords.count > 0 {
            Globals.notificationAddWordsFromList.value = .MyWords
//            Globals.autoAddWordsFromList = true
        }
        else {
            Globals.notificationTransitionToView.postNotification(.AddWords(exclude: [.MyWords]))
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}