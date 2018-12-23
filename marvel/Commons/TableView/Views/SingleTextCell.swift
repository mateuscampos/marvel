//
//  SingleTextCell.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public class SingleTextCell: UIView {
    
    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension SingleTextCell: Reusable {
    
}


extension SingleTextCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        self.addSubview(textLabel)
    }
    
    func setupConstraints() {
        
        textLabel.constraint { view in
            
            return [view.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                    view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                    view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
                    view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
                    view.heightAnchor.constraint(greaterThanOrEqualToConstant: 21)]
            
        }
        
    }
    
}

public extension SingleTextCell {
    
    public func setup(with data: Configuration) {
        
        textLabel.text = data.text
        textLabel.font = data.font
        
    }
    
    public struct Configuration {
        var font: UIFont?
        var text: String
    }
    
}

