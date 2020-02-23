//
//  Utilities.swift
//  Agora_iOS
//
//  Created by Syed on 24/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
//        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        bottomLine.backgroundColor = UIColor.systemOrange.cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
}
