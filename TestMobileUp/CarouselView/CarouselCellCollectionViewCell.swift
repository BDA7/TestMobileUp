//
//  CarouselCellCollectionViewCell.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 01.04.2022.
//

import UIKit

class CarouselCellCollectionViewCell: UICollectionViewCell {
    func configure(image: UIImageView) {
        self.imagePhoto = image
    }

    @IBOutlet weak var imagePhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
