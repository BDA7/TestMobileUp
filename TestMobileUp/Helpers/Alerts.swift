//
//  Alerts.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 02.04.2022.
//

import UIKit

class Alerts {
    static func createAlert(viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
