//
//  InterestCollectionViewCell.swift
//  CarouselEffect
//
//  Created by youngjun goo on 06/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    // UI 변경
    fileprivate func updateUI() {
        self.interestTitleLabel.text = interest.title
        self.featuredImageView.image = interest.featuredImage
    }
    
    // subView의 frame을 설정하는 함수
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // layer 모서리의 완만도 설정
        self.layer.cornerRadius = 5.0
        // subview의 경계에 Bound 가 되는지 결정하는 값
        self.clipsToBounds = true
    }
    
    
    
}
