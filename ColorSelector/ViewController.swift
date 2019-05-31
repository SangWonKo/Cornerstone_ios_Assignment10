//
//  ViewController.swift
//  ColorSelector
//
//  Created by Derrick Park on 2019-04-15.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        redSwitch.isOn = false
//        greenSwitch.isOn = false
//        blueSwitch.isOn = false
//
        
        colorView.layer.borderWidth = 5.0
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        let defaults = UserDefaults.standard
        
        redSwitch.isOn = defaults.bool(forKey: "redSwitchState")
        redSlider.value = defaults.float(forKey: "redSliderValue")
        
        greenSwitch.isOn = defaults.bool(forKey: "greenSwitchState")
        greenSlider.value = defaults.float(forKey: "greenSliderValue")
        
        blueSwitch.isOn = defaults.bool(forKey: "blueSwitchState")
        blueSlider.value = defaults.float(forKey: "blueSliderValue")
        
        updateControls()
        updateColor()

        
        
        
    }
    
    fileprivate func updateColor() {
        let defaults = UserDefaults.standard
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
            
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
            
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        let bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        colorView.backgroundColor = bgColor
        
        defaults.set(redSwitch.isOn, forKey: "redSwitchState")
        defaults.set(red, forKey: "redSliderValue")
        defaults.set(greenSwitch.isOn, forKey: "greenSwitchState")
        defaults.set(green, forKey: "greenSliderValue")
        defaults.set(blueSwitch.isOn, forKey: "blueSwitchState")
        defaults.set(blue, forKey: "blueSliderValue")
    }
    
    fileprivate func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateControls()
        updateColor()
        
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        updateControls()
        updateColor()
    }
    
}

