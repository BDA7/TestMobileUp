//
//  CarouselController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import Foundation
import UIKit

protocol CarouselControllerProtocol {
    var view: CarouselViewControllerProtocol? { get set }
    func getAlbums() -> [Album]
    func getOneImageFromAlbum(number: Int) -> Album
    func loadMainPhoto(photoNumber: Int)
}

class CarouselController: CarouselControllerProtocol {
    var albums: [Album] = [Album]()
    var view: CarouselViewControllerProtocol?
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func getOneImageFromAlbum(number: Int) -> Album {
        return albums[number]
    }
    func loadMainPhoto(photoNumber: Int) {
        let url = albums[photoNumber].sizes[5].url
        view?.updteMainPhoto(url: url)
    }

}
