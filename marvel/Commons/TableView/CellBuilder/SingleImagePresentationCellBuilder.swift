//
//  SingleImagePresentationCellBuilder.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

extension SingleImagePresentationCell: ContentCellConvertible {
    
    public static var cellHeight: ContentCellSize {
        return UIScreen.main.bounds.width - 32
    }
    
}

public typealias SingleImagePresentationCellBuilder = ContainerCellBuilder<SingleImagePresentationCell>

extension ContainerCellBuilder where T == SingleImagePresentationCell {

}
