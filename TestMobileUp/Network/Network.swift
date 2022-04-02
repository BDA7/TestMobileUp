//
//  Network.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import UIKit

class Network {
    func request(urlString: String, completion: @escaping (Result<NetworkJson, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                print(data)
                do {
                    let jsonVK = try JSONDecoder().decode(NetworkJson.self, from: data)
                    completion(.success(jsonVK))
                } catch  let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}

extension UIImageView {
    func load(link: String?) {
        if link != " ", link != nil {
            guard let url = URL(string: link! ) else { return }
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        } else {
            self.image = UIImage(named: "nullImage")
        }
    }
}
