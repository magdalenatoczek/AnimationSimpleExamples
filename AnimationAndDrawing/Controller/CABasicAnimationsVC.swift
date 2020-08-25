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

class CABasicAnimationsVC: UIViewController {
    
    
    var viewToAnimate: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
        
       
    }

    
    func setUpView(){
        viewToAnimate = UIView(frame: CGRect(x: self.view.center.x - 30, y: self.view.center.y - 30, width: 60, height: 60))
        viewToAnimate.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        viewToAnimate.layer.cornerRadius = viewToAnimate.frame.width/2
        view.addSubview(viewToAnimate)
    }
    
    
    
    @IBAction func goButtonPressed(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func backbuttonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
