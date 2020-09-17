//
//  ProgressView.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 17/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit
@IBDesignable
class ProgressView: UIView {
    
    
    let progressBarWidth : CGFloat = 300.0
    let progressBarHeight: CGFloat = 20.0
    
    var currentProgress: Double = 0.0 {
        
        didSet {
            if currentProgress > 1.0 {
                currentProgress = 1.0
            }
            
            if currentProgress < 0.0 {
                currentProgress = 0.0
            }
            
            setNeedsDisplay()
        }
        
        
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let currentProgressBarWidth : CGFloat = progressBarWidth * CGFloat(currentProgress)
        let progressBar = UIBezierPath(rect: CGRect(x: (bounds.width / 2) - (progressBarWidth / 2), y: (bounds.height / 2) - progressBarHeight/2, width: currentProgressBarWidth, height: progressBarHeight))
        UIColor.red.setFill()
        progressBar.fill()
        
    }
    
    
    
    

}
