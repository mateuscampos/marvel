//
//  LoadingViewCell.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public class LoadingViewCell: UIView {
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
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

extension LoadingViewCell: Reusable {
    
}


extension LoadingViewCell: ViewCodingProtocol {
    
    func configureViews() {
        self.backgroundColor = .white
        self.activityIndicator.startAnimating()
    }
    
    func buildViewHierarchy() {
        self.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        activityIndicator.constraint { view in
            
            return [view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                    view.centerYAnchor.constraint(equalTo: self.centerYAnchor)]
            
        }
        
    }
    
}

public extension LoadingViewCell {
    
    public func setup(with data: Configuration) {
        
        activityIndicator.tintColor = data.color
        
    }
    
    public struct Configuration {
        var color: UIColor
    }
    
}
