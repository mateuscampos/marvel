//
//  SingleImagePresentationCell.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public class SingleImagePresentationCell: UIView {
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        img.backgroundColor = .lightGray
        return img
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension SingleImagePresentationCell: Reusable {
    
}


extension SingleImagePresentationCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        self.addSubview(imageView)
    }
    
    func setupConstraints() {
        
        imageView.constraint { view in
            
            return [view.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                    view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                    view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
                    view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)]
            
        }
        
    }
    
}

public extension SingleImagePresentationCell {
    
    public func setup(with data: Configuration) {
        
        imageView.dowloadFromServer(link: data.imagePath)
        
    }
    
    public struct Configuration {
        var imagePath: String
    }
    
}
