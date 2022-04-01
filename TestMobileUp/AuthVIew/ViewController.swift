//
//  ViewController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 28.03.2022.
//

import UIKit
import VK_ios_sdk

class ViewController: UIViewController {
    private let VK_APP_ID = "8118485"
    private let permiss = [VK_PER_PHOTOS]
    private let controller = AuthController()

    @IBOutlet weak var authButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let sdkInstance = VKSdk.initialize(withAppId: self.VK_APP_ID)
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate = self
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        VKSdk.wakeUpSession(permiss) { state, error in
            if state == .authorized {
                self.controller.routePhoto(viewController: self)
            } else if error != nil {
                print(error)
            }
        }
    }

    @IBAction func authorizationVK(_ sender: Any) {
        VKSdk.authorize(self.permiss)
    }
}

extension ViewController: VKSdkDelegate, VKSdkUIDelegate {
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {}

    func vkSdkUserAuthorizationFailed() {
        print("FAIL")
    }

    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.present(controller, animated: true, completion: nil)
    }

    func vkSdkAccessTokenUpdated(_ newToken: VKAccessToken!, oldToken: VKAccessToken!) {
        if newToken != nil {
            controller.setToken(newToken: newToken.accessToken)
        } else if oldToken != nil {
            controller.setToken(newToken: oldToken.accessToken)
        }
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {}
}
