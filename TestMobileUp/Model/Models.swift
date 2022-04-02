//
//  Models.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import Foundation

struct NetworkJson: Decodable {
    let response: Albums
}
struct Albums: Decodable {
    let count: Int
    let items: [Album]
}
struct Album: Decodable {
    let album_id: Int
    let sizes: [SizePhoto]
}
struct SizePhoto: Decodable {
    let height: Int
    let url: String
}
