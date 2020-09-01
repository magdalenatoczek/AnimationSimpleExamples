//
//  CATransactionVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 01/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit



//CATransaction is defined as a mechanism to batch multiple layer tree operations into atomic updates to the render tree




class CATransactionVC: UIViewController {
    
    
    let newLayer = CALayer()
    let newView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(newView)
        newView.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        newView.layer.addSublayer(newLayer)
        
        newLayer.backgroundColor = UIColor.black.cgColor
      
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newLayer.frame = newView.bounds
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func goBtnpressed(_ sender: Any) {
        
        CATransaction.begin()
        
        
        CATransaction.setCompletionBlock {
            //alternative for delegats when mix animation
            //what should happen with modal version afer animation is stopped
            
         //   self.newLayer.backgroundColor = UIColor.blue.cgColor
        }

        CATransaction.setAnimationDuration(2)
        
        let timingFunc = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        CATransaction.setAnimationTimingFunction(timingFunc)
        
        newLayer.backgroundColor = UIColor.orange.cgColor
        newLayer.position = CGPoint(x: 200, y: 200)
    
        CATransaction.commit()
        
       
        //or animationGroup
        //let animationGroup = CAAnimationGroup()
        //animationGroup.duration = 5
        //animation/group = [firstAnimObject, secondAnimObject]
        //myviewToAnimate.layer.add(animationGroup, forKey:nil)
        
        
    }
    
}
