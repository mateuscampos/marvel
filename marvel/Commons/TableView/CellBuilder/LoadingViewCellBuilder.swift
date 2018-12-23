//
//  LoadingViewCellBuilder.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

extension LoadingViewCell: ContentCellConvertible {
    
    public static var cellHeight: ContentCellSize {
        return 44
    }
    
}

public typealias LoadingViewCellBuilder = ContainerCellBuilder<LoadingViewCell>

extension ContainerCellBuilder where T == LoadingViewCell {
    
    convenience init(color: UIColor = .lightGray) {
        self.init(LoadingViewCell.Configuration(color: color))
    }

}
