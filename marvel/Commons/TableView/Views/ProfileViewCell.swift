//
//  ProfileView.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public class ProfileViewCell: UIView {
    
    lazy var profileImage: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 25
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        img.backgroundColor = .lightGray
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 18)
        return label
    }()
    
    lazy var lastModificationDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 14)
        return label
    }()
    
    lazy var infoContainerView: UIView = UIView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension ProfileViewCell: Reusable {
    
}

extension ProfileViewCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        self.addSubview(profileImage)
        self.addSubview(infoContainerView)
        self.infoContainerView.addSubview(nameLabel)
        self.infoContainerView.addSubview(lastModificationDateLabel)
    }
    
    func setupConstraints() {
        
        self.profileImage.constraint { view in
            [view.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
             view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
             view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
             view.rightAnchor.constraint(equalTo: infoContainerView.leftAnchor, constant: -32),
             view.heightAnchor.constraint(equalToConstant: 100),
             view.widthAnchor.constraint(equalToConstant: 100)]
        }
        
        self.infoContainerView.constraint { view in
            [view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32),
             view.centerYAnchor.constraint(equalTo: self.centerYAnchor)]
        }
        
        self.nameLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: infoContainerView.topAnchor),
             view.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor),
             view.rightAnchor.constraint(equalTo: infoContainerView.rightAnchor),
             view.bottomAnchor.constraint(equalTo: lastModificationDateLabel.topAnchor, constant: -16)]
        }
        
        self.lastModificationDateLabel.constraint { view in
            [view.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor),
             view.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor),
             view.rightAnchor.constraint(equalTo: infoContainerView.rightAnchor)]
        }
        
    }
    
    func configureViews() {
        
        self.backgroundColor = .white
        
    }
    
}

public extension ProfileViewCell {
    
    public func setup(with data: Configuration) {
        
        nameLabel.text = data.name
        
        if let modificationDate = data.lastModificationDate {
            lastModificationDateLabel.text = String("Updated: \(modificationDate)")
        }
        
        if let profilePath = data.profilePicturePath {
            profileImage.dowloadFromServer(link: profilePath)
        }
        
    }
    
    public struct Configuration {
        var name: String
        var lastModificationDate: String?
        var profilePicturePath: String?
    }
    
}
