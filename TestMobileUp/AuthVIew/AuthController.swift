//
//  AuthController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 30.03.2022.
//

import Foundation
import UIKit

class AuthController {
    var token: String = ""
    func setToken(newToken: String) {
        self.token = newToken
    }

    func routePhoto(viewController: UIViewController) {
        let vc = ModulePhotoCells.build(token: self.token)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
