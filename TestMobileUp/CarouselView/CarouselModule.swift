//
//  CarouselModule.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import Foundation
import UIKit

class CarouselModule {
    static func build(albums: [Album], photoNumber: Int) -> CarouselViewController {
        let view = CarouselViewController()
        let controller = CarouselController()
        view.controller = controller
        controller.view = view
        controller.albums = albums
        controller.loadMainPhoto(photoNumber: photoNumber)
        return view
    }
}
