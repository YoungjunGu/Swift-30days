//
//  ViewController.swift
//  CarouselEffect
//
//  Created by youngjun goo on 06/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    fileprivate var interests = Interest.createInterests()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    // statusBar 설정
    // https://zeddios.tistory.com/569
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    // fileprivate 구조체를 사용하여 cell과 관련된 UI, Identifier를 설정 할 수 있다.
    fileprivate struct Storyboard {
        static let CellIdentifier = "InterestCell"
        static let CellPadding: CGFloat = 20.0
    }

}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! InterestCollectionViewCell
        
        cell.interest = self.interests[indexPath.item]
        
        return cell
    }
    
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 2 * Storyboard.CellPadding, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2 * Storyboard.CellPadding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return UIEdgeInsets(top: 0, left: Storyboard.CellPadding, bottom: 0, right: Storyboard.CellPadding)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let originPoint = targetContentOffset.pointee
        var index = Int(originPoint.x / UIScreen.main.bounds.width)
        let offset = Int(originPoint.x) % Int(UIScreen.main.bounds.width)
        index += (offset > Int(UIScreen.main.bounds.width / 2) ? 1 : 0)
        targetContentOffset.pointee = CGPoint(x: index * Int(UIScreen.main.bounds.width), y : 0 )
    }
}
