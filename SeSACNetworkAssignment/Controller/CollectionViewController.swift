//
//  CollectionViewController.swift
//  SeSACNetworkAssignment
//
//  Created by 김진수 on 1/16/24.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    let manager = BeerAPIManager()
    var beer: [Beer] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        callResponse()
    }

}

extension CollectionViewController {
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 4
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: 250)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 10, left: 4, bottom: 0, right: 4)
        layout.scrollDirection = .vertical

        let nib = UINib(nibName: BeerCollectionViewCell.identifier, bundle: nil)
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.register(nib, forCellWithReuseIdentifier: BeerCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    func callResponse() {
        manager.callResponseTable { result in
            self.beer = result
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerCollectionViewCell.identifier, for: indexPath) as! BeerCollectionViewCell
        
        let data = beer[indexPath.item]
        
        cell.configureCell(data: data)
        
        return cell
    }
    
}
