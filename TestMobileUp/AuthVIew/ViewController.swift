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
    let permiss = [VK_PER_PHOTOS, VK_PER_GROUPS, VK_PER_FRIENDS]

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
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {}

    @IBOutlet weak var authButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let sdkInstance = VKSdk.initialize(withAppId: self.VK_APP_ID)
        sdkInstance?.unregisterDelegate(self)
        sdkInstance?.uiDelegate = self
        view.backgroundColor = .darkGray

        VKSdk.wakeUpSession(permiss) { state, error in
            if state == .authorized {
                print("AAAAA")
                self.pushToPhoto()
            } else if error != nil {
                print(error)
            } else {
                VKSdk.authorize(self.permiss)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func authorizationVK(_ sender: Any) {
    }
    
}

extension ViewController {
    
    
}

extension ViewController {
    func pushToPhoto() {
        let vc = PhotoViewController()
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
}
