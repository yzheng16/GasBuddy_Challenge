//
//  PhotoSelectorHeaderCell.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-06-02.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class PhotoSelectorHeaderCell: UICollectionViewCell {
    var selectedImage: UIImage?{
        didSet{
            selectedImageView.image = selectedImage
        }
    }
    
    let selectedImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(selectedImageView)
        selectedImageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
