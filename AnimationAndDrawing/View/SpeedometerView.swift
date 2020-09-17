//
//  SpeedometerView.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 17/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


@IBDesignable
class SpeedometerView: UIView {

    var pointer = PointerLayer()
    
    var pointerColor : UIColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1) {
        
        didSet{
            pointer.fillColor = pointerColor.cgColor
            setNeedsDisplay()
        }
    }
    
    let arcWidth:CGFloat = 8.0
    
    
    @IBInspectable var markers:Int = 5 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    @IBInspectable var minSpeed :CGFloat = 0.0 {
         didSet{
             setNeedsDisplay()
         }
     }
     
    
    @IBInspectable var maxSpeed :CGFloat = 25.0 {
           didSet{
               setNeedsDisplay()
           }
       }
    
    
    @IBInspectable var textFont :UIFont = UIFont.boldSystemFont(ofSize: 20) {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var textColor :UIColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1) {
          didSet{
              setNeedsDisplay()
          }
      }
    
    
    
       override func draw(_ rect: CGRect) {
        
        drawArc(rect: rect)
        
      
    }
    
       override func layoutSubviews() {
           super.layoutSubviews()
           
           drawPointer()
       }
       
    
       override func didMoveToSuperview() {
           super.didMoveToSuperview()
           
            layer.addSublayer(pointer)
            changeAnchorPointOfPointer()
       
       }
    
    
    
    
    
    func drawArc(rect: CGRect){
        
        let centerOfArc = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius = min(bounds.width, bounds.height)/2
        let startAngle: CGFloat = 0.75 * CGFloat(Double.pi)
        let endAngle: CGFloat = 0.25 * CGFloat(Double.pi)
        let arc = UIBezierPath(arcCenter: centerOfArc, radius: radius - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        pointerColor.setStroke()
        arc.lineWidth = arcWidth
        arc.stroke()
        
        drawMarksOnArc(startAngle: startAngle, endAngle: endAngle, rect: rect)
        
        
    }
    
    func drawMarksOnArc(startAngle: CGFloat, endAngle: CGFloat, rect: CGRect){
        
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        pointerColor.setFill()
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLendthPerMark : CGFloat = angleDifference / CGFloat(markers)
        let multiplePerMark : CGFloat = (maxSpeed - minSpeed) / CGFloat(markers)
        let markerWidth : CGFloat = arcWidth * 0.8
        let markerSize: CGFloat = markerWidth * 2
        let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth / 2, y: 0, width: markerWidth, height: markerSize).integral)
        
        context.translateBy(x: rect.width / 2 ,y: rect.height / 2)
        
        for i in 0...markers {
            context.saveGState()
            
            let angle = arcLendthPerMark * CGFloat(i) + startAngle - .pi / 2
            context.rotate(by: angle)
            context.translateBy(x: 0, y: rect.height / 2 - markerSize)
            markerPath.fill()
            
            
            //labels
            context.rotate(by: CGFloat(Double.pi))
            let label = getRounded(value: multiplePerMark * CGFloat(i) + minSpeed)
            let labelWidth = label.width(font: textFont)
            let textPos = CGPoint(x: -labelWidth / 2, y: 0)
            label.draw(at: textPos, withAttributes : [NSAttributedString.Key.font: textFont, NSAttributedString.Key.foregroundColor: textColor])
            
            
            
            context.restoreGState()
        }
        context.restoreGState()
    }
    
    

    
    
    func drawPointer(){
        
        let viewWidth = frame.width
        let halfOfViewWidth = viewWidth/2
        let viewHeight = frame.height
        let pointerYPos: CGFloat = viewHeight * 0.05
        let pointerHeight: CGFloat = viewHeight * 0.4
        let pointerWidth: CGFloat = pointerHeight * 0.2
        let pointerFrame = CGRect(x: halfOfViewWidth - pointerWidth/2, y: pointerYPos, width: pointerWidth, height: pointerHeight).integral //no partcial units
        
        pointer.bounds.size = pointerFrame.size
        pointer.position.x = pointerFrame.origin.x + (pointerFrame.width/2)
        pointer.position.y = pointerFrame.origin.y + (pointerFrame.height)
        
        let pointerPath = UIBezierPath()
        pointerPath.move(to: CGPoint(x: pointerWidth/2, y: 0))  //relative to the bounds of the pointer not to the view
        pointerPath.addLine(to: CGPoint(x: pointerWidth, y: pointerHeight))
        pointerPath.addLine(to: CGPoint(x: 0, y: pointerHeight))
        pointerPath.close()
        pointer.path = pointerPath.cgPath
        pointer.fillColor = pointerColor.cgColor
  
    }
    
    
    func changeAnchorPointOfPointer(){
        //anchor default in the middle
        //swift anchor from center to the bottom
        // now it's 0.5 and 0.5
        let anchorPoint = CGPoint(x: 0.5, y: 1)
        //moving layer - bringing back to right position
        
        let newPoint = CGPoint(x: pointer.bounds.size.width * anchorPoint.x, y: pointer.bounds.size.height * anchorPoint.y)

        let oldPoint = CGPoint(x: pointer.bounds.size.width * pointer.anchorPoint.x, y: pointer.bounds.size.height * pointer.anchorPoint.y)

        var newPosition = pointer.position

        newPosition.x -= oldPoint.x
        newPosition.x += newPoint.x

        newPosition.y -= oldPoint.y
        newPosition.y += newPoint.y


        pointer.position = newPosition
        pointer.anchorPoint = anchorPoint
        
    }
    
    func getRounded(value: CGFloat) -> String{
        
        let divisor = pow(10, Double(1))
        let roundedNumber = (Double(value) * divisor).rounded() / divisor
        
        if roundedNumber.isZero {
            return "0"
        }
        
        let intRoundedNumber = Int(roundedNumber)
        
        if Double(intRoundedNumber) == roundedNumber {
            
            return "\(intRoundedNumber)"
            
        }
        
        return "\(roundedNumber)"
        
        
    }
    
    
    func rotatePointer(newSpeed: CGFloat){
        var speed = newSpeed
        
        if (speed > maxSpeed){
            speed = maxSpeed
        }
        
        if speed < minSpeed {
            speed = minSpeed
        }
        
        let fractalSpeed = (speed - minSpeed)/(maxSpeed-minSpeed)
        let newAngle = 0.75 * CGFloat(Double.pi)  * (2 * fractalSpeed - 1)
        pointer.transform = CATransform3DMakeRotation(newAngle, 0, 0, 1)
        
        
    }
    
    
    
    
    

}


extension String {
    func width(font: UIFont) -> CGFloat {
        
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: CGFloat(220))
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
}

@IBDesignable
class PointerLayer : CAShapeLayer {
    
    var springAnimation: Bool = true
    
    override func action(forKey event: String) -> CAAction? {
        if event == "transform" && springAnimation {
            let springAnimation = CASpringAnimation(keyPath : event)
            springAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            springAnimation.initialVelocity = 0.5
            springAnimation.damping = 1
            return springAnimation
            
        }
          return super.action(forKey: event)
    }
    
    
    override func awakeFromNib() {
        super.drawsAsynchronously = true
        springAnimation = true
 
    }
   
    

    
    
    
    
    
}



