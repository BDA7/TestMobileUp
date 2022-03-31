//
//  PhotoModule.swift.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import Foundation

class PhotoModule {
    static func buil() -> PhotoViewController {
        let view = PhotoViewController()
        let controller = PhotoController()
        view.controller = controller
        controller.view = view

        return view
    }
}
