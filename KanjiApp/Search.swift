//
//  Search.swift
//  KanjiApp
//
//  Created by Sky on 2014-07-24.
//  Copyright (c) 2014 Sky. All rights reserved.
//

import Foundation
import UIKit

class Search : CustomUIViewController {
    
//    var discoverLabels: [DiscoverAnimatedLabel] = []
    var timer:NSTimer? = nil
    
//    init(coder aDecoder: NSCoder!) {
//        
//        super.init(coder: aDecoder)
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        discoverLabels.map { self.animateLabel($0) }
        timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "onSpawnTimerTick", userInfo: nil, repeats: true)
    }
    
    func onSpawnTimerTick() {
        
        let inset: Double = 10.0
        let width: Double = 30.0
        let height: CGFloat = 250
        let verticalOutset: CGFloat = 200
        
        var distance = randomRange(0, 1)
        
        var animationLength: Double = 20 + 30 * distance
        
        var xPos = randomRange(inset, Double(UIScreen.mainScreen().bounds.width) - inset ) - width / 2
        xPos = round(xPos / 40) * 40 + 5
        
        var label = DiscoverAnimatedLabel(frame: CGRectMake(CGFloat(xPos), -verticalOutset, CGFloat(width), 200))
        
        if var card = fetchRandomCard() {
            label.text = card.kanji
        } else {
            if var card = fetchRandomCard() {
                label.text = card.kanji
            }
            else {
                label.text = "空"
            }
        }
        
        
        label.numberOfLines = 0
        label.font = UIFont(name: Globals.JapaneseFont, size: 24)
        label.textColor = UIColor(white: CGFloat(distance * 0.95), alpha: 1)
        
        self.view.addSubview(label)
        self.view.sendSubviewToBack(label)
        
//        UIView.setAnimationDelegate(self)
//        UIView.setAnimationDidStopSelector("onAnimationStopped")
        
//        UIView.setAnimationCurve()
        UIView.animateWithDuration(animationLength,
            delay: NSTimeInterval(),
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
            label.frame = CGRectMake(label.frame.origin.x, UIScreen.mainScreen().bounds.height + verticalOutset, label.frame.width, label.frame.height)
            },
            completion: { (_) -> Void in label.removeFromSuperview() })
        
        
        var labels:[DiscoverAnimatedLabel] = []
        for item in self.view.subviews {
            if let label = item as? DiscoverAnimatedLabel {
                labels += label
            }
        }
        
        labels.sort { CGColorGetComponents($0.textColor.CGColor)[0] < CGColorGetComponents($1.textColor.CGColor)[0] }
        
        for label in labels {
            println(CGColorGetComponents(label.textColor.CGColor)[0])
            
            self.view.sendSubviewToBack(label)
        }
    }
    
//    func onAnimationStopped(animationID: NSString, finished: NSNumber) {
//        
//    }
    
//    void)myAnimationStopped:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
//    {
    
    func fetchRandomCard() -> Card? {
        
        var rnd = Int(randomRange(1000, 9567))
        
        return managedObjectContext.fetchCardByIndex(rnd)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
//        discoverLabels = []
//        
//        for item in self.view.subviews {
//            if let label = item as? DiscoverAnimatedLabel {
//                
//                
//                label.removeFromSuperview()
//                
//                discoverLabels += add
//                self.animateLabel(add)
//            }
//        }
    }
    
//    func animateLabel(label: DiscoverAnimatedLabel) {
//        
//        println(label)
//            }
}