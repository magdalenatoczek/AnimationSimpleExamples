//
//  GradientStandaloneLayer.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 22/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class GradientStandaloneLayerVC: UIViewController, CAAnimationDelegate {
    
    
    @IBOutlet weak var containerView: UIView!
    
    var gradientLayer = CAGradientLayer()
    
    var gradients = [[CGColor]]()
    
    var currentSetOfGradient = 0
    var previousSetOfGradient = 0
        
    let firstColorForAnimation = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor
    let secondColorForAnimation = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).cgColor
    let thirdColorForAnimation = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
    let fourthColorForAnimation = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1).cgColor
    
    var currentStart = CGPoint(x: 0.0 , y: 0.0)
    var currentEnd = CGPoint(x: 1.0 , y: 1.0)
    
   
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      self.additionalSafeAreaInsets = UIEdgeInsets(top: -20.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        gradients.append([firstColorForAnimation, secondColorForAnimation, thirdColorForAnimation, fourthColorForAnimation])
        gradients.append([secondColorForAnimation, thirdColorForAnimation, fourthColorForAnimation, firstColorForAnimation])
        gradients.append([thirdColorForAnimation, fourthColorForAnimation, firstColorForAnimation, secondColorForAnimation])
        gradients.append([fourthColorForAnimation, firstColorForAnimation, secondColorForAnimation, thirdColorForAnimation])
        
        
            gradientLayer.colors = gradients[currentSetOfGradient]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.drawsAsynchronously = true
            containerView.layer.addSublayer(gradientLayer)
     
      
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = containerView.bounds
    }
    

     
     
    @IBAction func animateGradientButtonPressed(_ sender: Any) {
         animateGradient()
      
    }
    
    
    
    
    func animateGradient(){
        
        if currentSetOfGradient < gradients.count - 1 {
                   
                   currentSetOfGradient = currentSetOfGradient + 1
                   previousSetOfGradient = currentSetOfGradient - 1
                   
               } else {
                   currentSetOfGradient = 0
                   previousSetOfGradient = gradients.count - 1
               }
               
               
               
               let animation = CABasicAnimation(keyPath: "colors")
               animation.duration = 2.0
               animation.fromValue = gradients[previousSetOfGradient]
               animation.toValue = gradients[currentSetOfGradient]
               
               gradientLayer.setValue(currentSetOfGradient, forKey: "colorShouldChange")
                gradientLayer.colors = gradients[currentSetOfGradient]
             
               animation.delegate = self
               gradientLayer.add(animation, forKey: nil)
        
        
    }
    
    
 
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if flag{
            
            if let _ = gradientLayer.value(forKey: "colorShouldChange") as? Int {
               
                animateGradient()
  

            }
   
            
        }
        
    }
    
    
   
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
