//
//  PhotoController.swift.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import Foundation

protocol PhotoControllerProtocol {
    var view: PhotoViewProtocol? { get set }
}

class PhotoController: PhotoControllerProtocol {
    var view: PhotoViewProtocol?
    
    
}
