//
//  UIView+NSLayoutConstraint.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

extension UIView {
    
    func constraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        return NSLayoutConstraint.activate(closure(self))
        
    }
    
}
