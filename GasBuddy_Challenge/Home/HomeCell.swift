//
//  HomeCell.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-05-30.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            guard let label = photo?.title else{return}
            guard let photoUrl = photo?.thumbnailImageName else{return}
            navLabel.text = label
            navPhoto.loadImage(urlString: photoUrl)
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(navPhoto)
        addSubview(navLabel)
        addSubview(navArrow)
        
        navPhoto.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 22, leftConstant: 8, bottomConstant: 22, rightConstant: 0, widthConstant: 56, heightConstant: 56)
        
        navArrow.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 40, rightConstant: 8, widthConstant: 20, heightConstant: 20)
        navLabel.anchor(topAnchor, left: navPhoto.rightAnchor, bottom: bottomAnchor, right: navArrow.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    let navPhoto: CustomImageView = {
        let civ = CustomImageView()
        civ.contentMode = .scaleAspectFill
        civ.clipsToBounds = true
        return civ
    }()
    
    let navLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.text = "Test"
        return l
    }()
    
    let navArrow: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "arrowIcon")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
