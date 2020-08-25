//
//  CABasicAnimationsVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 25/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit



// explicit animation, model layer(in progress hiden - doesn't change), presentation layer(in progress visible)
// lower level API
// changed property will go back to begin state - becouse model doesn't change
// we must specyfy how the animation should occur
// we have to specify animation on the actual layer
//IMPORTANT : coordinate system of the layer is different from the view position start in the center

class CABasicAnimationsVC: UIViewController {
    
    
    var viewToAnimate: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
        
       
    }

    
    func setUpView(){
        viewToAnimate = UIView(frame: CGRect(x: 0, y: self.view.frame.height/2 - 30, width: 60, height: 60))
        viewToAnimate.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        viewToAnimate.layer.cornerRadius = viewToAnimate.frame.width/2
        view.addSubview(viewToAnimate)
    }
    
    
    
    @IBAction func goButtonPressed(_ sender: Any) {
        
       let basicAnimation = CABasicAnimation(keyPath: "position.x") //keyPath is a property of the layer we want to change //position, backgroundColor, opacity ect
    //  let basicAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position)) => then fromValue = ex [0.0 , 0.0]
        
        basicAnimation.fromValue = 0 + viewToAnimate.frame.width/2  // we can skip it when the start position is the view to animate position
        basicAnimation.toValue = view.frame.width - viewToAnimate.frame.width/2
        // or basicAnimation.byValue = 250
        
        
        
        //DO not Use it for move object to end state - the animation is not removed and the view to animate is not where it should be:
                //basicAnimation.fillMode = CAMediaTimingFillMode.forwards //what happened with presentation layer
                // basicAnimation.isRemovedOnCompletion = false
        
        
        basicAnimation.duration = 3.0
        
        basicAnimation.beginTime = CACurrentMediaTime() + 1.0 //delay
        
        
        
        
        basicAnimation.delegate = self
        
       // viewToAnimate.layer.add(basicAnimation, forKey: nil) //can be nil
        //basicAnimation.isRemovedOnCompletion = false  //if we want to use key but animation is still on the layer
        
        viewToAnimate.layer.setValue("anim1", forKey: "key1")
        
           //  viewToAnimate.layer.add(basicAnimation, forKey: "myKey")
        
 

        
        
    }
    
    
    @IBAction func backbuttonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension CABasicAnimationsVC : CAAnimationDelegate {
    
    func animationDidStart(_ anim: CAAnimation) {
        
        viewToAnimate.layer.position.x = view.frame.width - viewToAnimate.frame.width/2 // fromValue is needed // to move model layer object to end state
        
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if flag{
            
//            if anim == viewToAnimate.layer.animation(forKey: "myKey"){
//                print("stop")
//
//                   //to distinguish between animations
//            }
            
            
            guard let key = viewToAnimate.layer.value(forKey: "key1") else { return }
                print(key)
            
        }
        
  
    }
    
    
}
