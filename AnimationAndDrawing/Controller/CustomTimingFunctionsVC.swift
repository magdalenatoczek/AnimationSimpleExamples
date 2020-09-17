//
//  CustomTimingFunctionsVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 17/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


//https://cubic-bezier.com/


class CustomTimingFunctionsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func exampleForBasicAnimation(){
        
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.3, 0.85, 0.8, 0.15)
        let basicAnima = CABasicAnimation(keyPath: "position.x")
        basicAnima.timingFunction = timingFunction
    
    }
    
        func exampleForPropertyAnimation(){
        
            let cubicTimingParameters: UITimingCurveProvider = UICubicTimingParameters(controlPoint1: CGPoint(x: 0.3, y: 0.85), controlPoint2: CGPoint(x: 0.8, y: 0.15))
            
            let animator = UIViewPropertyAnimator(duration: 2, timingParameters: cubicTimingParameters)
            animator.addAnimations {
                //animations
            }
            animator.startAnimation()
            
            
            //or
            
            let propertyAnimator = UIViewPropertyAnimator(duration: 2, controlPoint1: CGPoint(x: 0.3, y: 0.85), controlPoint2: CGPoint(x: 0.8, y: 0.15)) {
                //animations
            }
            propertyAnimator.startAnimation()
            
    }
    
    
    
    func exampleForViewAnimation(){
        
        //use transaction
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.3, 0.85, 0.8, 0.15)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timingFunction)
      
        UIView.animate(withDuration: 1) {
            //animations
        }
        
        CATransaction.commit()
        
    }
    
    func exampleForKeyFrameAnimation(){
        
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.3, 0.85, 0.8, 0.15)
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position.x")
        keyFrameAnimation.values = [0,20,-20,0]
        keyFrameAnimation.keyTimes = [0, 0.2, 0.6, 1]
        keyFrameAnimation.duration = 3
        keyFrameAnimation.timingFunctions = [timingFunction,timingFunction,timingFunction]
        
        
        
    }
    
    

}
