//
//  SingleTextCellBuilder.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

extension SingleTextCell: ContentCellConvertible {
    
    public static var cellHeight: CGFloat {
        return 44
    }
    
}

public typealias SingleTextCellBuilder = ContainerCellBuilder<SingleTextCell>

extension ContainerCellBuilder where T == SingleTextCell {

}

