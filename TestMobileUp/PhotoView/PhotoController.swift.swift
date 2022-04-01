//
//  PhotoController.swift.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import Foundation
import UIKit

protocol PhotoControllerProtocol {
    var view: PhotoViewProtocol? { get set }
    func getData()
    func getAlbums() -> [Album]
    func getOneImageFromAlbum(number: Int) -> String
    func pushToCarousel(viewController: UIViewController)
}

class PhotoController: PhotoControllerProtocol {
    var view: PhotoViewProtocol?
    private var albums: [Album] = [Album]()
    
    let network = Network()
    func getData() {
        network.request(urlString: "https://api.vk.com/method/photos.get?owner_id=-128666765&album_id=266276915&access_token=870feaa4c578bb59a392ace8688673fc04e9c60a20f3933cbc47c9610d02a2be83ec4b4c204f05703af7b&v=5.131") { result in
            switch result {
                
            case .success(let request):
                self.albums = request.response.items
                self.view?.updateCollection()
            case .failure(let error):
                print(error)
            }
        }
    }

    func getAlbums() -> [Album] {
        return albums
    }
    
    func getOneImageFromAlbum(number: Int) -> String {
        return albums[number].sizes[2].url
    }
    func parseToImage() -> [UIImageView] {
        var arr: [UIImageView] = [UIImageView]()
        for album in albums {
            let imageView = UIImageView()
            imageView.load(link: album.sizes[2].url)
            arr.append(imageView)
        }
        return arr
    }

    func pushToCarousel(viewController: UIViewController) {
        let vc = CarouselModule.build(albums: parseToImage())
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
