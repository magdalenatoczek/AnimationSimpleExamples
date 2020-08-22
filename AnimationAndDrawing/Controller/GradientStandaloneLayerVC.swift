//
//  GradientStandaloneLayer.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 22/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class GradientStandaloneLayerVC: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    
    lazy var gradientLayer: CAGradientLayer = {
        
       return CAGradientLayer()
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
       var lot =  view.safeAreaInsets
       print(lot)
        
        
      self.additionalSafeAreaInsets = UIEdgeInsets(top: -20.0, left: 0.0, bottom: 0.0, right: 0.0)
      setUpGradientLayer()
     
       
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = containerView.bounds
    }
    

    func setUpGradientLayer(){
        
        gradientLayer.colors = [#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor, #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).cgColor, #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor, #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        containerView.layer.addSublayer(gradientLayer)
        
    }
     
        
   
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
