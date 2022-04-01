//
//  AuthController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import Foundation
import UIKit

class AuthController {
    func routePhoto(viewController: UIViewController) {
        let vc = ModulePhotoCells.build()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
