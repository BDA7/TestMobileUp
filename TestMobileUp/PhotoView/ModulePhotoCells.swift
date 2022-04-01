//
//  ModulePhotoCells.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import Foundation

class ModulePhotoCells {
    static func build() -> PhotoViewController {
        let view = PhotoViewController()
        let controller = PhotoController()
        view.controller = controller
        controller.view = view
        return view
    }
}