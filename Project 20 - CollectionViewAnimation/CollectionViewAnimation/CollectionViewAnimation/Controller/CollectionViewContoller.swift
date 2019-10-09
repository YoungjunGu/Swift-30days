//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by youngjun goo on 2019/10/09.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit


class CollectionViewContoller: UICollectionViewController {
    
    // 상당히 많은 identifier가 있을 경우 아래와 같이 구조체로 관리하는 것이 효율 적이고 명확하다.
    private struct Storyboard {
        static let CellIdentifier = "AnimationCollectionViewCell"
        static let NibName = "AnimationCollectionViewCell"
    }
    // 핵데이에서도 언급해준 것 처럼 수많은 상수 값이 프로젝트에 존재할 것인데 이를 구조체나 열거형으로 관리하는것이 효율 적이다.
    private struct Constants {
        static let AnimationDuration: Double = 0.5
        static let AnimationDelay: Double = 0.0
        static let AnimationSpringDamping: CGFloat = 1.0
        static let AnimationInitialSpringVelocity = 1.0
    }
    
    @IBOutlet var testCollectionView: UICollectionView! {
        didSet {
            self.testCollectionView.register(UINib(nibName: Storyboard.NibName, bundle: nil), forCellWithReuseIdentifier: Storyboard.CellIdentifier)
        }
    }
    
    var animationImages: AnimationImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationImages = AnimationImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 강제 추출 보다는 이렇게 하는 것을 지향하자
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as? AnimationCollectionViewCell, let viewModel = animationImages.images.safeIndex(indexPath.item) else {
                return UICollectionViewCell()
        }
        cell.prepareCell(viewModel)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animationImages.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else {
            return
        }
        
        self.handleAnimationCellSelected(collectionView, cell: cell)
    }
    
    private func handleAnimationCellSelected(_ collectionView: UICollectionView, cell: AnimationCollectionViewCell) {
        
        cell.handleCellSelected()
        cell.backButtonTapped = self.backButtonDidTouch
        
        let animations = {
            cell.frame = self.view.bounds
        }
        
        let completion: (_ finished: Bool) -> () = { _ in
            self.collectionView.isScrollEnabled = false
        }
        
        UIView.animate(withDuration: Constants.AnimationDuration, delay: Constants.AnimationDelay, usingSpringWithDamping: Constants.AnimationSpringDamping, initialSpringVelocity: CGFloat(Constants.AnimationInitialSpringVelocity), options: [], animations: animations, completion: completion)
    }
    
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView!.indexPathsForSelectedItems else {
            return
        }

        collectionView!.isScrollEnabled = true
        collectionView!.reloadItems(at: indexPaths)
    }
    
}

