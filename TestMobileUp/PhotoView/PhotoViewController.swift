//
//  PhotoViewController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import UIKit

protocol PhotoViewProtocol {
}

class PhotoViewController: UIViewController, PhotoViewProtocol {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.createLayoutCells())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }

    func setupCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .brown
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }

    func createLayoutCells() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 2, right: 2)
        layout.itemSize = CGSize(width: view.bounds.width/2.1, height: view.bounds.width/2.1)
        return layout
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.bounds.width/3, height: view.bounds.width/3)
//    }
    
}
