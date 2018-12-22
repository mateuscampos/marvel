//
//  ContainerTableViewCell.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public class ContainerTableViewCell: UITableViewCell, Reusable {
    
    var wrappedContentView: UIView?
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        wrappedContentView?.removeFromSuperview()
        wrappedContentView = nil
        
        self.backgroundColor = .clear
        self.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
    }
    
    public func addContent(_ content: UIView, insets: UIEdgeInsets) {
        
        wrappedContentView = content
        
        addSubview(content)

        content.constraint { view in
            
            guard let superview: UIView = content.superview else {
                fatalError("should have a superview")
            }

            content.layoutMargins = insets
            
            let top = content.topAnchor.constraint(equalTo: superview.topAnchor)
            let botton = content.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            botton.priority = .defaultHigh
            let right = content.rightAnchor.constraint(equalTo: superview.rightAnchor)
            let left = content.leftAnchor.constraint(equalTo: superview.leftAnchor)
            
            return [top,
                    botton,
                    right,
                    left]
            
        }
        
    }
    
}
