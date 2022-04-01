//
//  CarouselViewController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import UIKit

protocol CarouselViewControllerProtocol {
    var controller: CarouselControllerProtocol? { get set }
}

class CarouselViewController: UIViewController, CarouselViewControllerProtocol {
    var controller: CarouselControllerProtocol?
    lazy var bigCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/1.1), collectionViewLayout: createLayoutCellsForBig())
        collectionView.register(UINib(nibName: "CarouselCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "carouselCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    lazy var smallCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: bigCollectionView.frame.height, width: view.frame.width, height: view.frame.height - view.frame.height/1.1), collectionViewLayout: createLayoutCellsForSmall())
        collectionView.register(UINib(nibName: "CarouselCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "carouselCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.backgroundColor = .darkGray
    }

}

extension CarouselViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller?.getAlbums().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bigCollectionView.dequeueReusableCell(withReuseIdentifier: "carouselCell", for: indexPath) as! CarouselCellCollectionViewCell
        guard let imageURL = controller?.getOneImageFromAlbum(number: indexPath.row) else {
            return cell
        }
        cell.configure(image: imageURL)
        return cell
    }
    
    func setupCollectionView() {
        view.addSubview(bigCollectionView)
        view.addSubview(smallCollectionView)
        bigCollectionView.backgroundColor = .white
        smallCollectionView.backgroundColor = .white
    }

    func createLayoutCellsForBig() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.bounds.height/2.1, height: view.bounds.height/2.1)
        layout.scrollDirection = .horizontal
        return layout
    }
    func createLayoutCellsForSmall() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        layout.itemSize = CGSize(width: view.frame.height - view.frame.height/1.1 - 5, height: view.frame.height - view.frame.height/1.1 - 5)
        layout.scrollDirection = .horizontal
        return layout
    }
}
