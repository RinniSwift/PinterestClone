//
//  ViewController.swift
//  PinterestClone
//
//  Created by Rinni Swift on 12/4/18.
//  Copyright © 2018 Rinni Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    // MARK: Properties
    var images = [UIImage.init(named: "img"), UIImage.init(named: "img1"), UIImage.init(named: "img2"), UIImage.init(named: "img3"), UIImage.init(named: "img4"), UIImage.init(named: "img5"), UIImage.init(named: "img6"), UIImage.init(named: "img7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: Data Source
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.image.image = images[indexPath.row]
        return cell
    }
}

// MARK: Flow Layout Delegate
/*
    able to customize the collection view
    add line spacing (spacing between cells)
    add insets       (spacing between cell to the bounds
    create grids
 */
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfColumns: CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 10
        let cellSpacing: CGFloat = 5
        let image = images[indexPath.row]
        let height = image?.size.height
        
        return CGSize(width: (width / numOfColumns) - (xInsets + cellSpacing), height: (width / numOfColumns) - (xInsets + cellSpacing))
    }
}
