//
//  CAKeyFrameAnimationsVC.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 25/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//


//        There are three components: a key path (the property to animate), an array of values (the value you want to use for that property), and an array of key times (when that value should be used         for the property).
//        The number of key times needs to match the number of values


import UIKit

class CAKeyFrameAnimationsVC: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let CORRECT_PASSWORD = "password"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 3.0
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.backgroundColor = UIColor.white.cgColor
        
        
        passwordTextField.addTarget(self, action: #selector(passwordDidEndEditing), for: UIControl.Event.editingDidEndOnExit)

        // Do any additional setup after loading the view.
        
        
        let viewIsTappedGesture = UITapGestureRecognizer(target: self, action: #selector(viewIsTapped))
        
        view.addGestureRecognizer(viewIsTappedGesture)
        
        
    }
    
    
    
    @objc func viewIsTapped(){
        
        view.endEditing(true)  //keyboard
        
        
    }
    
   @objc func passwordDidEndEditing(){
    
    passwordTextField.resignFirstResponder()
    
    
    if passwordTextField.text != CORRECT_PASSWORD {
        
        let shakeAnimaion = CAKeyframeAnimation(keyPath: "position.x")
        
        
        
        

        
        shakeAnimaion.values = [0, -20, 20, -15, 15, 0]
        
        shakeAnimaion.duration = 0.5
        
        shakeAnimaion.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1.0]
        
        shakeAnimaion.isAdditive = true
        
        passwordTextField.layer.add(shakeAnimaion, forKey: nil)
        
        
        
        
    }else{
        print("password is correct")
    }
        
        
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
