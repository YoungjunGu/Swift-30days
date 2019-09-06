//
//  Interest.swift
//  CarouselEffect
//
//  Created by youngjun goo on 06/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class Interest {
    
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 9
    var featuredImage: UIImage!
    
    init(title: String, description: String, featuredImage: UIImage) {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfPosts = 1
        numberOfMembers = 1
    }
    
    // 객체 배열 형태로 생성, 딕셔너리 형태로도 나중에 할 수 있어야한다.
    static func createInterests() -> [Interest]
    {
        return [
            Interest(title: "Hello there, i miss u.", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            Interest(title: "🐳🐳🐳🐳🐳", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            Interest(title: "Training like this, #bodyline", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            Interest(title: "I'm hungry, indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            Interest(title: "Dark Varder, #emoji", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            Interest(title: "I have no idea, bitch", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
    }
}
