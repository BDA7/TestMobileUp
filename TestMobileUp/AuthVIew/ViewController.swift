//
//  ViewController.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 28.03.2022.
//

import UIKit
import VK_ios_sdk

class ViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    let VK_APP_ID = "8118485"
    let permiss = [VK_PER_PHOTOS, VK_PER_WALL]

    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print("Authorizatin true")
        guard
            let response = result.token,
            let email = response.email,
            let token = response.accessToken
        else { return }
        print("TOKEN: \(token)")
    }

    func vkSdkUserAuthorizationFailed() {
        print("FAIL")
    }

    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.present(controller, animated: true, completion: nil)
    }
    func vkSdkAccessTokenUpdated(_ newToken: VKAccessToken!, oldToken: VKAccessToken!) {
        if newToken != nil {
            self.token = newToken.accessToken
        }
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {}
    let controller = AuthController()
    private var token: String?

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
            } else {
                VKSdk.authorize(self.permiss)

            }
        }
        
    }
    @IBAction func authorizationVK(_ sender: Any) {
    }
    
}

