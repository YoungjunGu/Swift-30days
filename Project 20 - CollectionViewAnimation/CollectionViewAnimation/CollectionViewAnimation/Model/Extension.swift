//
//  Extension.swift
//  CollectionViewAnimation
//
//  Created by youngjun goo on 2019/10/09.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

extension Array {
    // 해당 범위 내의 값이면 컨첸츠 반환 아니면 nil 반환
    func safeIndex(_ i: Int) -> Element? {
        return i < self.count && i >= 0 ? self[i] : nil
    }
}
