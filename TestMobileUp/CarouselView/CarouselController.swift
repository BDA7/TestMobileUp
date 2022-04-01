//
//  CarouselController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import Foundation

protocol CarouselControllerProtocol {
    var view: CarouselViewControllerProtocol? { get set }
    func getAlbums() -> [Album]
    func getOneImageFromAlbum(number: Int) -> String
}

class CarouselController: CarouselControllerProtocol {
    var albums: [Album] = [Album]()
    var view: CarouselViewControllerProtocol?
    
    func getAlbums() -> [Album] {
        return albums
    }
    func loadingImages() {
        
    }
    
    func getOneImageFromAlbum(number: Int) -> String {
        return albums[number].sizes[2].url
    }
}
