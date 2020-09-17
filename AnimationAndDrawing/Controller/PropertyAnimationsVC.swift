//
//  PropertyAnimationsVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 24/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit




class PropertyAnimationsVC: UIViewController {
    
    var animator : UIViewPropertyAnimator!
    
    var startPositionX : CGFloat!
    var startPositionY : CGFloat!
    var startWidth : CGFloat!
    var startHeigth : CGFloat!
    
    
    @IBOutlet weak var viewToAnimate: UIView!
    
    
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startPositionX = viewToAnimate.layer.frame.origin.x
        startPositionY = viewToAnimate.layer.frame.origin.y
        startWidth = viewToAnimate.layer.frame.size.width
        startHeigth = viewToAnimate.layer.frame.size.height
        
        viewToAnimate.layer.cornerRadius = 10
        
        viewToAnimate.translatesAutoresizingMaskIntoConstraints = true
        
       setUpGoRightAnimation()

    
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        if animator.isRunning { //flying
            
            return
        }
        
        
        
        switch animator.state {
        case .active:
            
            //if we are here it's pause
            //we can make it reverse
            
            animator.isReversed = true
            
            //we can add next animation on this state
            
            animator.addAnimations {
                self.viewToAnimate.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
            
            
            
            animator.startAnimation()  //or continue
            
            break
        case .inactive:
            setUpGoRightRoundAnimation()
            animator.startAnimation()
            break
            
            
        case .stopped:
            animator.finishAnimation(at: .current)
           // animator.finishAnimation(at: .end)
           // animator.finishAnimation(at: .start)
            
            break
        default:
            break
        }
        
        
        
        
       
    }
    
    
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        
        if animator.state == UIViewAnimatingState.active{
            animator.pauseAnimation()
        }
        
    }
    
    
    
    @IBAction func stopButtonPressed(_ sender: Any) {
 
       // animator.stopAnimation(true)  // important : enter into .inactive state
        
        animator.stopAnimation(false)  // important : enter into .stopped state
    }
    
   
    
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        animator.fractionComplete = CGFloat(slider.value)
        //available only in .active  in pause state
    }
    
    
    func setUpGoRightAnimation() {
        
        resetAnimation()

        animator = UIViewPropertyAnimator(duration: 2, curve: UIView.AnimationCurve.easeInOut, animations: {
            
            self.viewToAnimate.frame.origin.x = self.view.frame.size.width - self.viewToAnimate.frame.size.width
        

        })
        
    }
    
    
    
    
    func setUpGoRightRoundAnimation() {
          
          resetAnimation()
          
          animator = UIViewPropertyAnimator(duration: 2, curve: UIView.AnimationCurve.easeInOut, animations: {
              
              self.viewToAnimate.frame.origin.x = self.view.frame.size.width - self.viewToAnimate.frame.size.width
              self.viewToAnimate.transform = CGAffineTransform(rotationAngle: CGFloat.pi)

          })
        
        animator.addCompletion { (position) in
            self.viewToAnimate.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        }
          
      }
    
   

    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        resetAnimation()
        
        
    }
    
    
    func resetAnimation(){
        self.viewToAnimate.transform = CGAffineTransform.identity
        self.viewToAnimate.layer.frame = CGRect(x: startPositionX, y: startPositionY, width: startWidth, height: startHeigth)
        self.viewToAnimate.backgroundColor = #colorLiteral(red: 0.8215630621, green: 0.1642869841, blue: 0.5031568846, alpha: 0.6791196311)
    }
    
}
