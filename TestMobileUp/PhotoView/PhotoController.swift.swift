//
//  PhotoController.swift.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import Foundation
import UIKit
import VK_ios_sdk

protocol PhotoControllerProtocol {
    var view: PhotoViewProtocol? { get set }
    func getData(token: String, viewController: UIViewController)
    func getAlbums() -> [Album]
    func getOneImageFromAlbum(number: Int) -> String
    func pushToCarousel(viewController: UIViewController, photoNumber: Int)
    func exit(viewController: UIViewController)
}

class PhotoController: PhotoControllerProtocol {
    var view: PhotoViewProtocol?
    private var url: String = "https://api.vk.com/method/photos.get?owner_id=-128666765&album_id=266276915&access_token="
    private var vkVersion: String = "&v=5.131"
    private var albums: [Album] = [Album]()
    
    let network = Network()
    func getData(token: String, viewController: UIViewController) {
        network.request(urlString: createURL(token: token)) { result in
            switch result {
                
            case .success(let request):
                self.albums = request.response.items
                self.view?.updateCollection()
            case .failure(let error):
                Alerts.createAlert(viewController: viewController, title: "Download Error", message: error.localizedDescription)
            }
        }
    }

    func createURL(token: String) -> String {
        return url + token + vkVersion
    }

    func getAlbums() -> [Album] {
        return albums
    }
    
    func getOneImageFromAlbum(number: Int) -> String {
        return albums[number].sizes[2].url
    }

    func pushToCarousel(viewController: UIViewController, photoNumber: Int) {
        let vc = CarouselModule.build(albums: albums, photoNumber: photoNumber)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }

    func exit(viewController: UIViewController) {
        VKSdk.forceLogout()
        viewController.navigationController?.popViewController(animated: true)
    }
}
