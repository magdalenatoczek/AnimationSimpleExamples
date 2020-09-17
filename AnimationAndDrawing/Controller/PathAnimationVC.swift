//
//  PathAnimation.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 17/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class PathAnimationVC: UIViewController {

    
   
    @IBOutlet weak var progressView: ProgressView!
    
    var startTime: Double = 0.0
    let animLength: Double = 4.0
    
    let sunView = UIView()
    let planetView = UIView()
    let sunSize: CGFloat = 120
    let planetSize: CGFloat = 80
    let margin: CGFloat = 20
    var halfHeight: CGFloat {
        return view.frame.height / 2
    }
    
    var displayLink: CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planetView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        planetView.frame = CGRect(x: view.frame.width - margin - planetSize , y: halfHeight - (planetSize / 2 ), width: planetSize, height: planetSize)
        planetView.layer.cornerRadius = planetView.frame.width / 2
        //or
        //  planetView.layer.contents = UIImage(named: "planetImage")?.cgImage
        view.addSubview(planetView)
        
       sunView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
       sunView.frame = CGRect(x: view.frame.width/2 - sunSize / 2 , y: view.frame.height / 2 - sunSize / 2, width: sunSize, height: sunSize)
       sunView.layer.cornerRadius = sunView.frame.width / 2
        //or
      //  sunView.layer.contents = UIImage(named: "sunImage")?.cgImage
       view.addSubview(sunView)
        
        
        
        
        //=================CADisplayLink
    startTime = CACurrentMediaTime()
    displayLink = CADisplayLink(target: self, selector: #selector(loop))
    displayLink?.add(to: .main, forMode: .default)
        
  
        
    }
    
    @objc func loop(){

        var elapsed =  CACurrentMediaTime() - startTime
        let currentProgress = elapsed / animLength
        progressView.currentProgress = currentProgress
        
        if elapsed > animLength {
            
            elapsed = animLength
            displayLink?.invalidate()
            displayLink = nil
            
        }
        

    }
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let orbitWidth: CGFloat = view.frame.width - (2 * margin) - CGFloat(planetSize)
        let orbitPath = UIBezierPath(ovalIn: CGRect(x: -orbitWidth, y: (-orbitWidth / 2), width: orbitWidth, height: orbitWidth))
        let orbitAnim = CAKeyframeAnimation(keyPath: "position")
        orbitAnim.duration = 3
        orbitAnim.isAdditive = true
        orbitAnim.calculationMode = CAAnimationCalculationMode.paced
      //  orbitAnim.rotationMode = CAAnimationRotationMode.rotateAuto
        orbitAnim.repeatCount = .greatestFiniteMagnitude
        orbitAnim.path = orbitPath.cgPath
        
        planetView.layer.add(orbitAnim, forKey: nil)
        
      
        
    }
    
    
    
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    

    
}
