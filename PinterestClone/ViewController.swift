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
