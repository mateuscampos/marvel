//
//  LoadingView.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public class LoadingView: UIView {
    
    private var parentView: UIView?
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }

}

extension LoadingView {
    
    func showIn(view: UIView) {
        parentView = view
        view.addSubview(self)
        setupViewConfiguration()
    }
    
    func remove() {
        
        self.removeFromSuperview()
        
    }
    
}

extension LoadingView: ViewCodingProtocol {
    
    func configureViews() {
        self.backgroundColor = .white
        self.activityIndicator.startAnimating()
    }
    
    func buildViewHierarchy() {
        self.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        self.constraint { view in
            
            guard let superview = view.superview else {
                fatalError("should have a superview")
            }
            
            return [view.topAnchor.constraint(equalTo: superview.topAnchor),
                    view.leftAnchor.constraint(equalTo: superview.leftAnchor),
                    view.rightAnchor.constraint(equalTo: superview.rightAnchor),
                    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)]
            
        }
        
        activityIndicator.constraint { view in

            return [view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                    view.centerYAnchor.constraint(equalTo: self.centerYAnchor)]
            
        }
        
    }
    
}
