//
//  PickerData.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 22/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation


enum PickerData : String {
    
   
    case animationWithDuration = "Animation with Duration"
    case gradientStandaloneLayer = "Gradient -CABasicAnimation"
    case propertyAnimations = "Property Animations"
    case caBasicAnimations = "CABasicAnimations"
    case caKeyFrameAnimations = "Shake CAKeyFrameAnimations"
    case caTransaction = "CATransaction"
    case caSpringAnimation = "CASpringAnimation"
    case PathAnimation = "PathAnimation"

    
    
    static let allCasesTab = [animationWithDuration.rawValue,PathAnimation.rawValue, caSpringAnimation.rawValue,propertyAnimations.rawValue, gradientStandaloneLayer.rawValue, caBasicAnimations.rawValue, caKeyFrameAnimations.rawValue, caTransaction.rawValue]
    
    
}
