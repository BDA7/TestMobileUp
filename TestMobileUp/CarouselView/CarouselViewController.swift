//
//  CarouselViewController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import UIKit
import SnapKit

protocol CarouselViewControllerProtocol {
    var controller: CarouselControllerProtocol? { get set }
    func updteMainPhoto(newImage: UIImageView)
}

class CarouselViewController: UIViewController, CarouselViewControllerProtocol {
    var controller: CarouselControllerProtocol?
    lazy var smallCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: view.frame.height/1.2, width: view.frame.width, height: view.frame.height - view.frame.height/1.2), collectionViewLayout: createLayoutCellsForSmall())
        collectionView.register(UINib(nibName: "CarouselCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "carouselCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    lazy var photo: UIImageView = {
        let image = UIImageView()
        return image
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupPhtoto()
        self.navigationController?.navigationBar.topItem?.title = " "
    }

}

extension CarouselViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller?.getAlbums().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = smallCollectionView.dequeueReusableCell(withReuseIdentifier: "carouselCell", for: indexPath) as! CarouselCellCollectionViewCell
        guard let imageURL = controller?.getOneImageFromAlbum(number: indexPath.row) else {
            return cell
        }
        cell.configure(image: imageURL.sizes[2].url)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        controller?.loadMainPhoto(photoNumber: indexPath.row)
    }
    
    func setupCollectionView() {
        view.addSubview(smallCollectionView)
        smallCollectionView.backgroundColor = .white
    }

    func createLayoutCellsForSmall() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.height - view.frame.height/1.1, height: view.frame.height - view.frame.height/1.1)
        layout.scrollDirection = .horizontal
        return layout
    }
}

extension CarouselViewController {
    func setupPhtoto() {
        view.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(view.bounds.width/1.8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(view.bounds.width/1.8)
        }
    }

    func updteMainPhoto(newImage: UIImageView) {
        self.photo = newImage
    }
}
