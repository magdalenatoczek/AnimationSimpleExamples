//
//  ViewController.swift
//  AnimationAndDrawing
//
//  Created by Magdalena Toczek on 21/08/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class MainPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var goBtn: UIButton!
    private var pickerStatus = PickerData.animationWithDuration.rawValue
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        picker.backgroundColor = #colorLiteral(red: 0.4871233729, green: 0.6604111165, blue: 0.06908242564, alpha: 1)
       
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
    }

    
    // MARK: - basic picker methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerData.allCasesTab.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerData.allCasesTab[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       pickerStatus = PickerData.allCasesTab[row]
    }
    
    
     // MARK: - buttons
    @IBAction func goButtonClicked(_ sender: Any) {
    
        switch pickerStatus {
            
            
            
        case PickerData.caSpringAnimation.rawValue:
                              let vc = storyboard?.instantiateViewController(withIdentifier: "CASpringAnimationVC") as! CASpringAnimationVC
                                       vc.modalPresentationStyle = .fullScreen
                                       present(vc, animated: true, completion: nil)
                                       break
            
            
            
            
            
            case PickerData.animationWithDuration.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "AnimationWithDurationVC") as! AnimationWithDurationVC
                             vc.modalPresentationStyle = .fullScreen
                             present(vc, animated: true, completion: nil)
                             break
            
            
            
            case PickerData.propertyAnimations.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "PropertyAnimationsVC") as! PropertyAnimationsVC
                             vc.modalPresentationStyle = .fullScreen
                            vc.modalTransitionStyle = .flipHorizontal
                             present(vc, animated: true, completion: nil)
                             break
            
            
            case PickerData.gradientStandaloneLayer.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "GradientStandaloneLayerVC") as! GradientStandaloneLayerVC
                            vc.modalPresentationStyle = .fullScreen
                            present(vc, animated: true, completion: nil)
                            break
            
            case PickerData.caBasicAnimations.rawValue:
                            let vc = storyboard?.instantiateViewController(withIdentifier: "CABasicAnimationsVC") as! CABasicAnimationsVC
                                    vc.modalPresentationStyle = .fullScreen
                              vc.modalTransitionStyle = .flipHorizontal
                                    present(vc, animated: true, completion: nil)
                                    break
            
            case PickerData.caKeyFrameAnimations.rawValue:
                            let vc = storyboard?.instantiateViewController(withIdentifier: "CAKeyFrameAnimationsVC") as! CAKeyFrameAnimationsVC
                                    vc.modalPresentationStyle = .fullScreen
                                    vc.modalTransitionStyle = .coverVertical
                                    present(vc, animated: true, completion: nil)
                                    break
            
            case PickerData.caTransaction.rawValue:
                               let vc = storyboard?.instantiateViewController(withIdentifier: "CATransactionVC") as! CATransactionVC
                                        vc.modalPresentationStyle = .fullScreen
                                        present(vc, animated: true, completion: nil)
                                        break
            
            
        default:
            break
 
        }
        
          
          
      }
    
    
    
}

