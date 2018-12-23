//
//  ProfileViewCellBuilder.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

extension ProfileViewCell: ContentCellConvertible {
    
    public static var cellHeight: ContentCellSize {
        return 132
    }
    
}

public typealias ProfileViewCellBuilder = ContainerCellBuilder<ProfileViewCell>

extension ContainerCellBuilder where T == ProfileViewCell {
    
    convenience init(hero: Hero, onSelect: (() -> Void)? = nil) {
        
        self.init(Configuration(name: hero.name,
                                lastModificationDate: hero.modified,
                                profilePicturePath: hero.thumbnail.fullPath()),
                  onSelect: onSelect)
        
    }
    
}
