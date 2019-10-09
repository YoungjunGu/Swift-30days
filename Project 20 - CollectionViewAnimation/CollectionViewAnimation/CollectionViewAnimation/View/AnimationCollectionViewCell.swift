//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation
//
//  Created by youngjun goo on 2019/10/09.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!
    
    // 클로저형 변수 선언
    var backButtonTapped: (()-> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareCell(_ viewModel: CellModel) {
        animationImageView.image = UIImage(named: viewModel.imagePath)
        // textView의 스크롤을 막아야한다 dismiss와 겹칠 수 있기 때문
        animationTextView.isScrollEnabled = false
        backButton.isHidden = true
        addTapEventHandler()
    }
    
    func handleCellSelected() {
        print("호출")
        animationTextView.isScrollEnabled = false
        backButton.isHidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    private func addTapEventHandler() {
        backButton.addTarget(self, action: #selector(backButtonDidTouch(_:)), for: .touchUpInside)
    }
    
    @objc func backButtonDidTouch(_ sender: UIGestureRecognizer) {
        backButtonTapped?()
    }

}
