//
//  CardsFinished.swift
//  KanjiApp
//
//  Created by Sky on 2014-08-14.
//  Copyright (c) 2014 Sky. All rights reserved.
//

import Foundation
import UIKit

class CardsFinished : CustomUIViewController {
    
    @IBOutlet weak var continueStudying: UIButton!
    
    var studyAheadAmount: Double = 60 * 60 * 24 * 5
    
    @IBAction func continueStudyingPressed(sender: AnyObject) {
        //        println("continueStudyingPressed")
        
        Globals.notificationTransitionToView.postNotification(.GameMode(studyAheadAmount: studyAheadAmount, runTutorial: false))
    }
    
    @IBAction func addNewCardsPressed(sender: AnyObject) {
        //        println("addNewCardsPressed")
        
        let myWords = managedObjectContext.fetchCardsWillStudy()
        if myWords.count > 0 {
            Globals.notificationAddWordsFromList.postNotification(.MyWords)
        }
        else {
            Globals.notificationTransitionToView.postNotification(.AddWords(enableOnAdd: true))
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let due = managedObjectContext.fetchCardsDue(fetchAheadAmount: studyAheadAmount)
        
        continueStudying.enabled = due.count != 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let cards = managedObjectContext.fetchCardsAllUser()
        if cards.count == 0 {
            Globals.notificationTransitionToView.postNotification(.AddWords(enableOnAdd: true))
        }
    }
}