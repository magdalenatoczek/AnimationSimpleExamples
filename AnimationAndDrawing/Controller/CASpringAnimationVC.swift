//
//  CASpringAnimationVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 17/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class CASpringAnimationVC: UIViewController {
    
    
    
    @IBOutlet weak var speedometerView: SpeedometerView!
    
    
    @IBOutlet weak var slider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        let sliderValue = sender.value
        let speed = speedometerView.maxSpeed * CGFloat(sliderValue)
        speedometerView.rotatePointer(newSpeed: speed)
        
    }
    
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
 
    }
    
    
    

}
