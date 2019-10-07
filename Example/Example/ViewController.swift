//
//  ViewController.swift
//  Example
//
//  Created by Oguz Parlak on 5.10.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import UIKit
import EasyAction

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let button = UIButton()
        button.setTitle("Press Me !", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 200, y: 600, width: 200, height: 60)
        view.addSubview(button)
        
        AlertBuilder(title: "TextFieldExample", message: "Your message goes here")
            // Add and configure your text field here
            .addTextField({ (textField) in
                textField.isSecureTextEntry = true
                textField.placeholder = "Enter Password"
            })
            .addAction("Cancel", style: .cancel)
            // Add Action with handler, if you want to work with textfield later
            // add textFieldHandler callback as well
            .addAction("OK", style: .default, { [weak self] in
                self?.doSomething()
                }, textFieldHandler: { [weak self] (textFields) in
                    guard let text: String = textFields?.first?.text else { return }
                    self?.validatePassword(text)
            })
            .setTintColor(.black)
            .show()
    }
    
    private func doSomething() {
        print("This function does something...")
    }
    
    private func validatePassword(_ text: String) {
        print("Validating password...")
    }
    
}

