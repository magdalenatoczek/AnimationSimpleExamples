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
    case gradientStandaloneLayer = "Gradient Standalone Layer"
    case propertyAnimations = "Property Animations"
    case caBasicAnimations = "CABasicAnimations"
    case caKeyFrameAnimations = "CAKeyFrameAnimations"
    
    
    static let allCasesTab = [animationWithDuration.rawValue,propertyAnimations.rawValue, gradientStandaloneLayer.rawValue, caBasicAnimations.rawValue, caKeyFrameAnimations.rawValue]
    
    
}
