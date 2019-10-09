//
//  AnimationImage.swift
//  CollectionViewAnimation
//
//  Created by youngjun goo on 2019/10/09.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit


struct AnimationImage {
    private let imagePaths = ["1", "2", "3", "4", "5"]
    var images: [CellModel]
    
    init() {
        images = imagePaths.map { CellModel(imagePath: $0) }
    }
}
