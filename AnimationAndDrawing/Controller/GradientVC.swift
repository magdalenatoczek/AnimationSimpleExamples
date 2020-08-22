//
//  GradientVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 22/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class GradientVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    view.layer.contents = UIImage(named: "rabbitL")?.cgImage
    view.layer.contentsGravity = CALayerContentsGravity.center 
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

    
   

}
