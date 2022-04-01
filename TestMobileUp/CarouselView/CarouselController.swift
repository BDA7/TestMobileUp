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
    func getAlbums() -> [UIImageView]
    func getOneImageFromAlbum(number: Int) -> UIImageView
}

class CarouselController: CarouselControllerProtocol {
    var albums: [UIImageView] = [UIImageView]()
    var view: CarouselViewControllerProtocol?
    
    func getAlbums() -> [UIImageView] {
        return albums
    }
    func loadingImages() {
        
    }
    
    func getOneImageFromAlbum(number: Int) -> UIImageView {
        return albums[number]
    }
}
