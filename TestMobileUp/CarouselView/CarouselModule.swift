//
//  CarouselModule.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import Foundation

class CarouselModule {
    static func build(albums: [Album]) -> CarouselViewController {
        let view = CarouselViewController()
        let controller = CarouselController()
        view.controller = controller
        controller.view = view
        controller.albums = albums
        return view
    }
}
