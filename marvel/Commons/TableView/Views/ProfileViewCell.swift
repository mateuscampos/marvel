//
//  ProfileView.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public class ProfileViewCell: UITableViewCell {
    
    lazy var profileImage: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 3
        img.layer.masksToBounds = true
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
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

extension ProfileViewCell: Reusable {
    
}

extension ProfileViewCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        self.contentView.addSubview(profileImage)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(lastModificationDateLabel)
    }
    
    func setupConstraints() {
        
        
    }
    
    func configureViews() {
        
        self.backgroundColor = .white
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0,
                                           left: self.bounds.width,
                                           bottom: 0,
                                           right: 0)
        
    }
    
}

public extension ProfileViewCell {
    
    public func configure(with data: Configuration) {
        
        nameLabel.text = data.name
        
        if let modificationDate = data.lastModificationDate {
            lastModificationDateLabel.text = String("Updated: \(modificationDate)")
        }
        
        if let profilePath = data.profilePicturePath {
            profileImage.image = loadImageFrom(path: profilePath)
        }
        
    }
    
    public struct Configuration {
        var name: String
        var lastModificationDate: String?
        var profilePicturePath: String?
    }
    
}

public extension ProfileViewCell {
    
    func loadImageFrom(path: String) -> UIImage {
        return UIImage()
    }
    
}
