//
//  PhotoViewController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import UIKit
import SnapKit

protocol PhotoViewProtocol {
    var controller: PhotoControllerProtocol? { get set }
    func updateCollection()
}

class PhotoViewController: UIViewController, PhotoViewProtocol {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.createLayoutCells())
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    var controller: PhotoControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        title = "Mobile Up Gallery"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        setupCollection()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выход", style: .plain, target: self, action: #selector(logoutVk(_:)))
    }

    func setupCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller?.getAlbums().count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        guard let element = controller?.getOneImageFromAlbum(number: indexPath.row) else {
            return cell
        }
        cell.configure(url: element)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        controller?.pushToCarousel(viewController: self, photoNumber: indexPath.row)
    }

    func createLayoutCells() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.bounds.width/2.1, height: view.bounds.width/2.1)
        return layout
    }
    
    func updateCollection() {
        collectionView.reloadData()
    }
    
}

extension PhotoViewController {
    @objc
    func logoutVk(_ sender: UIButton) {
        controller?.exit(viewController: self)
    }
}
