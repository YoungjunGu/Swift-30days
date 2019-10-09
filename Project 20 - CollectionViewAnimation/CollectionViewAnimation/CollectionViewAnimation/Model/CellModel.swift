//
//  CellModel.swift
//  CollectionViewAnimation
//
//  Created by youngjun goo on 2019/10/09.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

struct CellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}
