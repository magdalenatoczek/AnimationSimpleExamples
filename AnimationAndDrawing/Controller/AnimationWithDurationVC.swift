//
//  AnimationWithDurationVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 22/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


// implicit animation - handle how a view should animate to a new property.
// (alpha, frame ios is making it into the layer for us)
// model layer(in progress hiden), presentation layer(in progress visible) after animation
// changed property will be in the new state after animaion finish

class AnimationWithDurationVC: UIViewController {

    @IBOutlet weak var viewToAnimate: UIView!
    
    var startPositionX : CGFloat!
    var startPositionY : CGFloat!
    var startWidth : CGFloat!
    var startHeigth : CGFloat!
    
    
    let sizeChangeUp : CGFloat = 2
    let sizeChangeDown: CGFloat = 0.60
    var startAngle : CGFloat = .pi/180
    
 //   var  viewToAnimateOnlyInCode : UIView!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startPositionX = viewToAnimate.layer.frame.origin.x
        startPositionY = viewToAnimate.layer.frame.origin.y
        startWidth = viewToAnimate.layer.frame.size.width
        startHeigth = viewToAnimate.layer.frame.size.height
        
        viewToAnimate.translatesAutoresizingMaskIntoConstraints = true //there is a constraints conflict.
        
        
        
        
        // in code there is no constrants conflict where moving -
//        viewToAnimateOnlyInCode = UIView(frame :CGRect(x: startPositionX, y: startPositionY, width: startWidth, height: startHeigth))
//        viewToAnimateOnlyInCode.backgroundColor = UIColor.blue
//        view.addSubview(viewToAnimateOnlyInCode)

   
    }
    
    
    
    @IBAction func rotateButtonClicked(_ sender: Any) {
        
        startAngle = startAngle * 20
        
        
              UIView.animate(withDuration: 2) {
                
                self.viewToAnimate.transform = CGAffineTransform.init(rotationAngle: self.startAngle )

              }
              
        
    }
    
    
    
    @IBAction func changeColorButtonClicked(_ sender: Any) {
        
        UIView.animate(withDuration: 2) {
            self.viewToAnimate.layer.cornerRadius = 20.0
            self.viewToAnimate.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
        
    }
    
    
    
    @IBAction func opacityButtonClicked(_ sender: Any) {
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 7, options: .curveEaseOut, animations: {
            self.viewToAnimate.layer.opacity = 0.5
        }) { (finish) in
            self.viewToAnimate.layer.opacity = 1.0
        }
        
    }
    
    
    

    @IBAction func chainMoveClicked(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.viewToAnimate.transform = CGAffineTransform.identity
            self.moveUp()
        }) { success in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.moveRight()
                        }) { success in
                                UIView.animate(withDuration: 0.5, animations: {
                                        self.moveDown()
                                        }) { success in
                                                UIView.animate(withDuration: 0.5, animations: {
                                                        self.moveLeft()
                                                            }) { success in
                                                                    UIView.animate(withDuration: 0.5, animations: {
                                                                        self.viewToAnimate.layer.frame = CGRect(x: self.startPositionX, y: self.startPositionY, width: self.startWidth, height: self.startHeigth)
                        
                                                                                })
                                                                            }
                                                                    }
                                                                }
                                                            }
        }
    
    
    
    @IBAction func chainWithOptionsWasClicked(_ sender: Any) {
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseIn , animations: {
            self.viewToAnimate.transform = CGAffineTransform.identity
            self.moveUp()
            
        }) { success in
                      UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut , animations: {
                        self.moveRight()
                        }) { success in
                                  UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut , animations: {
                                        self.moveDown()
                                        }) { success in
                                            UIView.animate(withDuration: 2, delay: 0, options: .autoreverse , animations: {
                                                        self.moveLeft()
                                                            }) { success in
                                                                UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
                                                                        self.viewToAnimate.layer.frame = CGRect(x: self.startPositionX, y: self.startPositionY, width: self.startWidth, height: self.startHeigth)
                        
                                                                                })
                                                                            }
                                                                    }
                                                                }
                                                            }

    }
    
    
    
    
    @IBAction func chainWithSpringClicked(_ sender: Any) {
        
        
       
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 4, options: .curveEaseIn,
                       animations: {
                         self.viewToAnimate.transform = CGAffineTransform.identity
                        self.moveUp()
               }) { success in
                              
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 6, options: .curveEaseOut,
                                                   animations: {
                               self.moveRight()
                               }) { success in
                                          
                                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 7, options: .beginFromCurrentState,
                                                               animations: {
                                               self.moveDown()
                                               }) { success in
                                                    
                                                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3, options: .curveLinear,
                                                                         animations: {
                                                               self.moveLeft()
                                                                   }) { success in
                                                                        
                                                                    UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 2, options: .curveEaseIn,
                                                                                             animations: {
                                                                               self.viewToAnimate.layer.frame = CGRect(x: self.startPositionX, y: self.startPositionY, width: self.startWidth, height: self.startHeigth)
                               
                                                                                       })
                                                                                   }
                                                                           }
                                                                       }
                                                                   }

    }
    

    
    @IBAction func moveUpClicked(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.moveUp()
        }
        
    }
    
    
    
    @IBAction func moveRightClicked(_ sender: Any) {
        UIView.animate(withDuration: 1) {
                   self.moveRight()
               }
               
    }
    
    
    @IBAction func moveDownClicked(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.moveDown()
        }
    }
    
    
    @IBAction func moveLeftClicked(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.moveLeft()
        }
    }
    
    
    
    @IBAction func resetPressed(_ sender: Any) {
        
         UIView.animate(withDuration: 1.5) {
               self.viewToAnimate.transform = CGAffineTransform.identity
            self.viewToAnimate.layer.frame = CGRect(x: self.startPositionX, y: self.startPositionY, width: self.startWidth, height: self.startHeigth)
            self.viewToAnimate.layer.opacity = 1.0
             self.viewToAnimate.layer.cornerRadius = 0.0
            self.viewToAnimate.layer.backgroundColor = #colorLiteral(red: 1, green: 0.3557812257, blue: 0.2406072935, alpha: 1)
         
        }
    }
    
    @IBAction func makeViewGrowPressed(_ sender: Any) {
        
         UIView.animate(withDuration: 1.5) {
            
            let positionX = self.viewToAnimate.layer.frame.origin.x
            let positionY = self.viewToAnimate.layer.frame.origin.y
            let width = self.viewToAnimate.layer.frame.size.width
            let heigth = self.viewToAnimate.layer.frame.size.height

            let newWidth = width * self.sizeChangeUp
            let newHeight = heigth * self.sizeChangeUp
        
            let newPositionX = positionX - (newWidth - width)/2
            let newPositionY = positionY - (newHeight - heigth)/2
        
            
            self.viewToAnimate.layer.frame = CGRect(x: newPositionX, y: newPositionY, width: newWidth, height: newHeight)
            
        }
    }
    
    
    @IBAction func makeSmalerPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 1.5) {
            
                let positionX = self.viewToAnimate.layer.frame.origin.x
                let positionY = self.viewToAnimate.layer.frame.origin.y
                let width = self.viewToAnimate.layer.frame.size.width
                let heigth = self.viewToAnimate.layer.frame.size.height
                
                
                let newWidth = width * self.sizeChangeDown
                let newHeight = heigth * self.sizeChangeDown
            
                let newPositionX = positionX + (width - newWidth)/2
                let newPositionY = positionY + (heigth - newHeight)/2
                   
              self.viewToAnimate.layer.frame = CGRect(x: newPositionX, y: newPositionY, width: newWidth, height: newHeight)
            
            
        }
       
        
    }
    
    
    
    func moveUp(){
        
        self.viewToAnimate.frame.origin = CGPoint(x: self.viewToAnimate.frame.origin.x, y: 0)
       
        
        
    }
    
    func moveRight(){
        
        self.viewToAnimate.frame.origin = CGPoint(x: self.view.frame.width - self.viewToAnimate.frame.width, y: self.viewToAnimate.frame.origin.y)
      
    }
    
    func moveDown(){
        self.viewToAnimate.frame.origin = CGPoint(x: self.viewToAnimate.frame.origin.x,  y: self.view.frame.height - self.viewToAnimate.frame.height)
        
    
    }
    
    func moveLeft(){
        self.viewToAnimate.frame.origin = CGPoint(x: 0,  y:self.viewToAnimate.frame.origin.y)
       
    }
    

    
    @IBAction func backButtonpressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
