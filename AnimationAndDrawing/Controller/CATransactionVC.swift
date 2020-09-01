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
        newView.backgroundColor = UIColor.black
      //  newLayer.backgroundColor = UIColor.black.cgColor
      
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
            
            self.newView.layer.position = CGPoint(x: 200, y: 200)
            self.newView.layer.cornerRadius = self.newView.layer.frame.width/2
            
        }

        CATransaction.setAnimationDuration(2)
        
        let timingFunc = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        CATransaction.setAnimationTimingFunction(timingFunc)
        
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8, options:.curveEaseIn, animations: {
            self.newView.backgroundColor = UIColor.orange
            
            
        }, completion: nil)
        

        let positionXAnimation = CABasicAnimation(keyPath: "position.x")
        positionXAnimation.toValue = 200
        
        let positionYAnimation = CABasicAnimation(keyPath: "position.y")
               positionYAnimation.toValue = 200
        
        
        let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
        cornerRadiusAnimation.toValue = self.newView.layer.frame.width/2

        newView.layer.add(positionXAnimation, forKey: nil)
        newView.layer.add(positionYAnimation, forKey: nil)
         newView.layer.add(cornerRadiusAnimation, forKey: nil)

    
        CATransaction.commit()
        
       
        //or animationGroup
        //let animationGroup = CAAnimationGroup()
        //animationGroup.duration = 5
        //animation/group = [firstAnimObject, secondAnimObject]
        //myviewToAnimate.layer.add(animationGroup, forKey:nil)
        
        
    }
    
}
