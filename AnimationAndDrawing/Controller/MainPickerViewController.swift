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
            
            
            case PickerData.animationWithDuration.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "AnimationWithDurationVC") as! AnimationWithDurationVC
                             vc.modalPresentationStyle = .fullScreen
                             present(vc, animated: true, completion: nil)
                             break
            
            
            
            case PickerData.propertyAnimations.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "PropertyAnimationsVC") as! PropertyAnimationsVC
                             vc.modalPresentationStyle = .fullScreen
                             present(vc, animated: true, completion: nil)
                             break
            
            
            case PickerData.gradientStandaloneLayer.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "GradientStandaloneLayerVC") as! GradientStandaloneLayerVC
                            vc.modalPresentationStyle = .fullScreen
                            present(vc, animated: true, completion: nil)
                            break
        default:
            break
 
        }
        
          
          
      }
    
    
    
}

