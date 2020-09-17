//
//  notes.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 22/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation
import UIKit


//using an additional layer  => implement viewDidLayoutSubviews() 



class ExampleClassForNotes: UIViewController {
    
    
    lazy var standaloneLayer : CALayer = {
        
        return CALayer()
    }()

    
 
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpStandaloneLayer()
       

    }
    

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        standaloneLayer.frame = view.bounds
    }
  
    
    
    
    
    
    
    func setUpStandaloneLayer(){

     //this layer needs a viewDidLayoutSubviews()
        
        standaloneLayer.backgroundColor = UIColor.black.cgColor
        standaloneLayer.cornerRadius = CGFloat(10.0)
        standaloneLayer.borderColor = UIColor.red.cgColor
        standaloneLayer.borderWidth = CGFloat(5.0)
        standaloneLayer.shadowOpacity = 0.7 //(float 0-1)
        standaloneLayer.shadowRadius = CGFloat(15.0)
        standaloneLayer.shadowOffset = CGSize(width: CGFloat(-15), height: CGFloat(15))
        standaloneLayer.shadowOffset = CGSize.zero
        standaloneLayer.contents = UIImage(named: "rabbitL")?.cgImage
        standaloneLayer.contentsGravity = CALayerContentsGravity.center //prevent resizing to fit
        standaloneLayer.masksToBounds = true   //shadow will dissapear -> //use smaller image
        view.layer.addSublayer(standaloneLayer)
        
    }
    
    func setUpNormalLayer(){
        //same method highier level and lower level
          view.backgroundColor = UIColor.black
          view.layer.backgroundColor = UIColor.black.cgColor
          view.layer.cornerRadius = CGFloat(10.0)
          view.layer.borderColor = UIColor.red.cgColor
          view.layer.borderWidth = CGFloat(5.0)
          view.layer.shadowOpacity = 0.7 //(float 0-1)
          view.layer.shadowRadius = CGFloat(15.0)
          view.layer.shadowOffset = CGSize(width: CGFloat(-15), height: CGFloat(15))
          view.layer.shadowOffset = CGSize.zero
          view.layer.contents = UIImage(named: "rabbitL")?.cgImage
          view.layer.contentsGravity = CALayerContentsGravity.center //prevent resizing to fit
          view.layer.masksToBounds = true   //shadow will dissapear -> //use smaller image
    }
    
   

}



