//
//  CarouselCellCollectionViewCell.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import UIKit

class CarouselCellCollectionViewCell: UICollectionViewCell {
    func configure(image: String) {
        self.imagePhoto.load(link: image)
    }

    @IBOutlet weak var imagePhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
