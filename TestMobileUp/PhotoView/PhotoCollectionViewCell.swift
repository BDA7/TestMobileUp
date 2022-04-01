//
//  PhotoCollectionViewCell.swift
//  TestMobileUp
//
//  Created by Илья Коваленко on 31.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    func configure(url: String) {
        photoImage.load(link: url)
    }

    @IBOutlet weak var photoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImage.contentMode = .scaleToFill
        // Initialization code
    }

}
